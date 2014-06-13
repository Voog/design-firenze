/*
    <head>
        <link rel="stylesheet" type="text/css" href="/edicy-search.css" />
    </head>

    <body>

        <form class="search-form">
            <input type="search"/>
        </form>

        <script src="edicy-search.js"></script>
        <script type="text/javascript">
            var search = new VoogSearch($('.search-form').get(0), {
                per_page: 3,
                lang: '{{ page.language_code }}'
            });
        </script>
    </body>

*/

(function() {

    // some cool native functions

    var ajaxGET = function(options) {
        var r = new XMLHttpRequest(),
            dataStrArr = [],
            dataStr = "";

        if (options.data) {
            for (var d in options.data) {
                if (options.data.hasOwnProperty(d)) {
                    dataStrArr.push(d + "=" + encodeURIComponent(options.data[d]));
                }
            }
            dataStr = dataStrArr.join('&');
            if (options.url.indexOf("?") === -1) dataStr = "?" +  dataStr;
            if (options.url.indexOf("&") > -1) dataStr = "&" +  dataStr;
        }

        r.open("GET", options.url + dataStr, true);
        r.onreadystatechange = function () {
            if (r.readyState === 4) {
                if (r.status === 200) {
                    if (options.success) {
                        options.success(r.responseText, r);
                    }
                } else {
                    if (options.error) {
                        options.error(r);
                    }
                }
            }
        };
        r.send();
    };

    var proxy = function(fn, context) {
        var args = [].slice.call(arguments, 2);
        return function() {
            return fn.apply(context || this, args.concat([].slice.call(arguments)));
        };
    };

    var extend = function() {
        var o = arguments[0];
        for (var j = 1, max = arguments.length; j < max; j++) {
            for(var i in arguments[j]) {
                if (arguments[j].hasOwnProperty(i)) {
                    o[i] = arguments[j][i];
                }
            }
        }
        return o;
    };

    var parse_link_header = function (header) {
        var links = {};

        if (header.length > 0) {
            var parts = header.split(',');

            for (var i = 0, max = parts.length; i < max; i++) {
                p = parts[i];
                var section = p.split(';');
                if (section.length != 2) {
                    throw new Error("section could not be split on ';'");
                }
                var url = section[0].replace(/<(.*)>/, '$1').trim();
                var name = section[1].replace(/rel="(.*)"/, '$1').trim();
                links[name] = url;
            }
        }

        return links;
    };

    var createElements = function(html) {
        var div = document.createElement('div');
        div.innerHTML = html;
        return div.childNodes;
    };

    /**
     * Method to set dom events
     *
     * example:
     *    var observer = observe(iframe.contentWindow.document.body, ["focus", "blur"], function() { ... });
     *
     * unbinding:
     *    observer.stop();
    **/
    var observe = function(element, eventNames, handler) {
      eventNames = typeof(eventNames) === "string" ? [eventNames] : eventNames;

      var handlerWrapper,
          eventName,
          length  = eventNames.length;

      for (var i = 0; i < length; i++) {
        eventName = eventNames[i];
        if (element.addEventListener) {
          element.addEventListener(eventName, handler, false);
        } else {
          handlerWrapper = function(event) {
            if (!("target" in event)) {
              event.target = event.srcElement;
            }
            event.preventDefault = event.preventDefault || function() {
              this.returnValue = false;
            };
            event.stopPropagation = event.stopPropagation || function() {
              this.cancelBubble = true;
            };
            handler.call(element, event);
          };
          element.attachEvent("on" + eventName, handlerWrapper);
        }
      }

      return {
        stop: function() {
          var eventName,
              i       = 0,
              length  = eventNames.length;
          for (; i<length; i++) {
            eventName = eventNames[i];
            if (element.removeEventListener) {
              element.removeEventListener(eventName, handler, false);
            } else {
              element.detachEvent("on" + eventName, handlerWrapper);
            }
          }
        }
      };
    };

    var offset = function(elem) {
      var box = elem.getBoundingClientRect();
      return {
        top: box.top + (window.pageYOffset || document.documentElement.scrollTop) - (document.documentElement.clientTop || 0),
        left: box.left + (window.pageXOffset || document.documentElement.scrollLeft) - (document.documentElement.clientLeft || 0),
        width: (typeof box.width !== undefined) ? box.width : elem.offsetWidth,
        height: (typeof box.height !== undefined) ? box.height : elem.offsetHeight
      };
    };

    var windowSize = function() {
        var w = window,
            d = document,
            e = d.documentElement,
            g = d.getElementsByTagName('body')[0];

        return {
            width: w.innerWidth || e.clientWidth || g.clientWidth,
            height: w.innerHeight|| e.clientHeight|| g.clientHeight,
            scrollTop: (w.pageYOffset || e.scrollTop),
            scrollLeft: (w.pageXOffset || e.scrollLeft)
        };
    };

    var contains = (function() {
        var documentElement = document.documentElement;
        if (documentElement.contains) {
            return function(container, element) {
                if (element.nodeType !== 1) {
                    element = element.parentNode;
                }
                return container !== element && container.contains(element);
            };
        } else if (documentElement.compareDocumentPosition) {
            return function(container, element) {
                // https://developer.mozilla.org/en/DOM/Node.compareDocumentPosition
                return !!(container.compareDocumentPosition(element) & 16);
            };
        }
    })();


    // Voog Searcher SDK

    var searcherDefaults = {
        url: '/admin/api/search',
        params: {}
    };

    var Searcher = function(options, complete) {
        this.options = extend({}, searcherDefaults);
        this.options.complete = complete;
        extend(this.options.params, options);
    };

    Searcher.prototype = {
        query: function(params) {

            if (params && params.q) {
                var p = extend({}, this.options.params, params);
                this.fetch(this.options.url, p);
            } else {
                throw new Error("No search query provided");
            }
        },

        handleSuccess: function(data, jqXHR, origParams) {
            var pages = 2,
                totalEntries = 4,
                links = (data.page && data.page === 2) ? {"prev": "/assets/page1.json?page=1&1=1", "first": "/assets/page1.json?page=1&1=1", "last": "/assets/page2.json?page=2&1=1"}:  {"next": "/assets/page2.json?page=2&1=1", "first": "/assets/page1.json?page=1&1=1", "last": "/assets/page2.json?page=2&1=1"},

                //parse_link_header(jqXHR.getResponseHeader('link')),
                ret = extend({
                    "pages": {
                        "total": pages,
                        "page": origParams.page || 1
                    },
                    "totalEntries": totalEntries
                }, data),
                that = this;

            if (pages > 1) {

                // Bind page prev, next, first and last functions
                for (var i in links) {
                    if (links.hasOwnProperty(i)) {
                        // encapsulate the current loop value and return action function to results
                        (function(link, key) {
                            ret.pages[key] = proxy(function() {
                                that.fetch(link, null, origParams);
                            }, that);
                        })(links[i], i);
                    }
                }

                // Bind page getNr function
                ret.pages["getNr"] = proxy(function(nr) {
                    var p = extend({}, origParams, {page: nr});
                    this.fetch(this.options.url, p);
                }, this);

            }

            console.log(ret);

            if (this.options.complete) this.options.complete(ret);
        },

        fetch: function(url, data, origParams) {
            var uuu = (url === "/assets/page2.json?page=2&1=1") ? "/assets/page2.json?page=2&1=1" : "/assets/page1.json?page=1&1=1";
            ajaxGET({
                url: uuu,
                data: data,
                success: proxy(function(data1, jqXHR) {
                    var pnr, spnr, o;
                    if (origParams) {
                        spnr = (/[\?&]page=([^&#]*)/).exec(url);
                        pnr = (spnr === null) ?  1 : parseInt(spnr[1], 10);
                        o = extend({}, origParams, {page: pnr});
                    } else {
                        o = data;
                    }
                    this.handleSuccess(JSON.parse(data1 || "null"), jqXHR, o);
                }, this),
                error: proxy(this.handleError, this)
            });
        },

        handleError: function(r) {
            if (this.options.complete) {
                this.options.complete(null);
            }
        }

    };
    window.VoogSearchSDK = Searcher;

// Search UI

    var searcherUIdefaults = {
        lang: 'en',
        resultTpl: '<div class="voog-search-modal-result"><h3 class="voog-search-title"><a class="voog-search-link" href="[[url]]">[[title]]</a></h3><p class="voog-search-content">[[content]]</p></div>',
        modalTpl: '<div class="voog-search-modal"><div class="voog-search-modal-results"></div><div class="voog-search-loader"></div></div>',
        noResults: 'No results found!'
    };

    var SearcherUI = function (el, options) {
        this.el = el;
        this.options = extend({}, searcherUIdefaults, options);
        this.init();
    };

    SearcherUI.prototype = {

        init: function() {
            this.input = this.el.querySelector('input[type="search"], input[type="text"]');

            this.modal = this.createModal();
            this.searcher = new VoogSearchSDK(this.filterParams(this.options), proxy(this.handleSearchResult, this));
            observe(this.el, "submit", proxy(this.handleSubmit, this));
            observe(this.input, "keyup", proxy(this.handleInputKeyUp, this));
            observe(this.el, "reset", proxy(this.handleInputKeyUp, this));
        },

        handleSubmit: function(event) {
            event.preventDefault();
            this.setLoading();

            var val = this.input.value,
                resultEl = this.modal.querySelector('.voog-search-modal-results');

            resultEl.innerHTML = '';

            if (val) {
                this.searcher.query({
                    q: val
                });
            } else {
                this.hideModal();
            }
            return false;
        },

        setLoading: function() {
            this.loading_active = true;
            this.modal.className = this.modal.className.replace('loading', '').trim();
            this.modal.className = this.modal.className + ' loading';
        },

        unsetLoading: function() {
            this.modal.className = this.modal.className.replace('loading', '').trim();
            this.loading_active = false;
        },

        // Not all options are to be sent to search as params sdk
        filterParams: function(p) {
            var allowed = ['per_page', 'page', 'lang', 'q', 'types', 'tags', 'path', 'tag_facets'],
                o = {};
            for (var i = allowed.length; i--;) {
                if (typeof p[allowed[i]] !== "undefined") {
                    o[allowed[i]] = p[allowed[i]];
                }
            }
            return o;
        },

        handleSearchResult: function(data) {
            this.pageLinks = data.pages;
            this.renderContent(data.result);
            this.showModal();
            this.unsetLoading();
        },

        createModal: function() {
            var modal = createElements(this.options.modalTpl)[0];
            observe(modal, 'scroll', proxy(this.handleModalScroll, this));
            observe(modal, ['mousewheel', 'DOMMouseScroll'], proxy(this.handleMouseWheel, this));
            return modal;
        },

        showModal: function() {
            var pos = offset(this.input),
                wSize= windowSize();

            this.modal.style.visibility = "hidden";
            document.body.appendChild(this.modal);

            var w = this.modal.offsetWidth,
                h = this.modal.offsetHeight;

            this.modal.style.left = Math.min(Math.max(pos.left + ((pos.width - w)/2) , wSize.scrollLeft + 10), wSize.scrollLeft + wSize.width - w - 10) + 'px';

            if (wSize.height + wSize.scrollTop < pos.top + pos.height + h) {
                this.modal.style.top = Math.max(pos.top - h, 0) + 'px';
            } else {
                this.modal.style.top = Math.max(pos.top + pos.height, 0) + 'px';
            }

            this.modal.style.visibility = "visible";

            if(!this.sideClickHandler) {
                this.sideClickHandler = observe(document, 'click', proxy(this.handleSideClick, this));
            }
            if(!this.resizeHandler) {
                this.resizeHandler = observe(window, 'resize', proxy(this.handleResize, this));
            }
        },

        hideModal: function() {
            var parent = this.modal.parentNode;
            if (!parent) { return; }
            parent.removeChild(this.modal);

            if(this.sideClickHandler) {
                this.sideClickHandler.stop();
                this.sideClickHandler = null;
            }

            if(this.resizeHandler) {
                this.resizeHandler.stop();
                this.resizeHandler = null;
            }
        },

        handleModalScroll: function(event) {
            var y = this.modal.scrollTop,
                maxy = this.modal.scrollHeight - this.modal.offsetHeight,
                treshold = 10;

            if (y >= maxy - 10 && !this.loading_active && this.pageLinks && this.pageLinks.page < this.pageLinks.total) {
                this.fetchNextPage();
            }
        },

        // stops page behind from scrolling if search rsults scroll is at bottom
        handleMouseWheel: function(event) {
            var delta = event.wheelDeltaY/2 || event.detail * -10,
                y = this.modal.scrollTop,
                maxy = this.modal.scrollHeight - this.modal.offsetHeight;

            if ((y >= maxy && delta < 0) || (y <= 0 && delta > 0)) {
                event.stopPropagation();
                event.preventDefault();
            }
        },

        fetchNextPage: function() {
            this.setLoading();
            this.pageLinks.next();
        },

        handleSideClick: function(event) {
            if (event.target !== this.input && event.target !== this.modal && !contains(this.modal, event.target)) {
                this.hideModal();
            }
        },

        handleResize: function(event) {
            if (this.modal.parentNode) {
                this.showModal();
            }
        },

        renderContent: function(results) {
            var resultEl = this.modal.querySelector('.voog-search-modal-results');
            this.modal.className = this.modal.className.replace('no-content', '').trim();

            if(results.length) {
                for (var i = 0, max = results.length; i< max; i++) {
                    resultEl.appendChild(createElements(this.options.resultTpl.replace(/\[\[url\]\]/g, results[i].path)
                                                          .replace(/\[\[title\]\]/g, results[i].title)
                                                          .replace(/\[\[content\]\]/g, results[i].description))[0]);
                }
            } else {
                resultEl.appendChild(document.createTextNode(this.options.noResults));
                this.modal.className += ' no-content';
            }
        },

        handleInputKeyUp: function(event) {
            var that = this;
            setTimeout(proxy(function() {
                this.el.className = this.el.className.replace('not-empty', '').trim();
                if (this.input.value && this.input.value !== "") {
                    this.el.className += ' not-empty';
                }
            }, this), 0);
        }
    };

    window.VoogSearch = SearcherUI;

})();
