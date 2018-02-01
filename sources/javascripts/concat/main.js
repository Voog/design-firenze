;(function($) {
  var editmode = $('html').hasClass('editmode');
  var bgPickerFallback = $('body').hasClass('bgpicker-fallback');

  // Remove comments if debouncing is used.
  // Function to limit the rate at which a function can fire.
  var debounce = function(func, wait, immediate) {
    var timeout;
    return function() {
      var context = this, args = arguments;
      var later = function() {
        timeout = null;
        if (!immediate) func.apply(context, args);
      };
      var callNow = immediate && !timeout;
      clearTimeout(timeout);
      timeout = setTimeout(later, wait);
      if (callNow) func.apply(context, args);
    };
  };

  // Shows/hides the popover main menu (visible on smalles screens).
  var handleElementsClick = function() {
    $('html').click(function() {
      if ($('.js-btn').hasClass('open')) {
        $('.js-btn').removeClass('open');
      }

      if ($('.js-popover').hasClass('expanded')) {
        $('.js-popover').removeClass('expanded');
      }

      if ($('.js-search-inner').hasClass('active')) {
        $('.js-search-inner').removeClass('active');
      }
    });

    // Toggles the popover main menu (visible on smalles screens).
    $('.js-menu-btn').click(function(event) {
      event.stopPropagation();
      $(this).toggleClass('open');
      $('.js-menu-main').toggleClass('expanded');

      if ($('.js-search-close-btn').hasClass('open')) {
        $('.js-search-close-btn').trigger('click');
      }
    });

    // Toggles the popover language menu.
    $('.js-menu-lang-btn').click(function(event) {
      event.stopPropagation();
      $('.js-menu-lang-btn').toggleClass('open');
      $('.js-menu-lang').toggleClass('expanded');
    });

    $('.js-tags-btn').click(function(event) {
      event.stopPropagation();
      $(this).toggleClass('open');
      $('.js-menu-tags').toggleClass('expanded');
    });

    // Hides search modal on side click
    $('.js-search').click(function() {
      $('.js-search-close-btn').trigger('click');
    });

    // Opens the search modal.
    $('.js-search-open-btn').click(function(event) {
      event.stopPropagation();
      if ($('.js-menu-btn').hasClass('open')) {
        $('.js-menu-btn').trigger('click');
      }

      $('html').addClass('search-open');
      $(this).addClass('open');
      $('.js-search-close-btn').addClass('open');
      $('.js-search').addClass('active');
      $('.js-search-input').val('').focus();
    });

    // Closes the search modal.
    $('.js-search-close-btn').click(function(event) {
      event.stopPropagation();
      $('html').removeClass('search-open');
      $('.js-search-open-btn, .js-search-close-btn').removeClass('open');
      $('.js-search').removeClass('active');
      $('.js-voog-search-modal').removeClass('search-results-active');
    });

    $('.js-search-form, .js-voog-search-modal').click(function(event) {
      event.stopPropagation();
    });
  };

  // Sets the search modal height.
  var handleSearchModalHeight = function() {
    var windowWidth = $(window).width();
        windowHeight = $(window).height(),
        searchModal = $('.js-voog-search-modal');

        if (windowWidth >= 1400 ) {
          searchModalHeight = windowHeight - 190;
        } else {
          searchModalHeight = windowHeight - 171;
        }

    searchModal.css({'max-height': searchModalHeight});
  };

  // Sets search modal height on search submit.
  var handleSearchSubmit = function() {
    $('.js-search-form').on('submit', function() {
      handleSearchModalHeight();
    });
  };

  // Scrolls to the comment-form if comment submit failed (to show the error messages to the user)
  var focusFormWithErrors = function() {
    $(document).ready(function() {
      if ($('.comment-form').hasClass('form_with_errors')) {
        $('html, body').scrollTop($('.comment-form').offset().top);
      } else if ($('form').find('.form_error, .form_notice').length > 0) {
        $('html, body').scrollTop($('.form_error, .form_notice').closest('form').offset().top);
      }
    });
  };

  // Toggles the topbar of the position and scroll direction
  var handleTopbarPosition = function() {
    var startScroll,
    toHandler,
    endScroll,
    scrolled,
    container = $('.js-container'),
    topbar = $('.js-topbar'),
    header = $('.js-header'),
    tagsMenu = $('.js-menu-tags'),
    topbarHeight = $(topbar).outerHeight(),
    topbarVisibleArea = $(header).outerHeight() + 150,
    tagsMenuHeight = $(tagsMenu).outerHeight();

    $(topbar).css({'top' : -topbarHeight});

    $(window).on("scroll", function(){
      // Forces to hide the topbar if browser is at the begginning of the page (IE fix).
      if ($(window).scrollTop() <= 0) {
        $(topbar).css({'top' : -topbarHeight});
      }

      if (!startScroll) {
        startScroll = $(window).scrollTop();
      } else {
        endScroll = $(window).scrollTop();
        scrolled = endScroll - startScroll;

        if (scrolled < -5 && startScroll > topbarVisibleArea) {
          if ($('body').hasClass('edy-checkout-button-visible')) {
            headerOffset = $('.edy-ecommerce-shopping-cart-button').outerHeight();
          } else {
            headerOffset = 0;
          }

          $(topbar).css({'top' : headerOffset});
        } else if ((scrolled < 0 && startScroll < topbarVisibleArea) || (scrolled > 0 && startScroll > topbarVisibleArea)) {
          if (tagsMenu.hasClass('expanded')) {
            $(tagsMenu).removeClass('expanded');
            $('.js-tags-btn').removeClass('open');
          }
          $(topbar).css({'top' : -topbarHeight});
        }

        startScroll = 0;
      }
    });
  };

  handleLayoutPositioning = function() {
    var container = $('.js-container');
    containerWrap = container.find('.js-wrap'),
    footer = $('.js-footer'),
    footerInner = $('.js-footer-inner'),
    footerGradientHeight = 85,
    editmodePanelHeight = 40,
    // TODO: Is this normal?
    windowHeight = editmode ? windowHeight = $(window).height() - editmodePanelHeight : windowHeight = $(window).height(),
    brakePoint = 2 * footer.innerHeight() - footerGradientHeight + containerWrap.innerHeight();

    if (brakePoint > windowHeight) {
      container.addClass('container-long');
    } else {
      container.removeClass('container-long');
    };
  }

  // Sets the position of the footer to the bottom of the page
  var handleContentMutations = function() {
    var MutationObserver = (function () {
      var prefixes = ['WebKit', 'Moz', 'O', 'Ms', '']
      for(var i=0; i < prefixes.length; i++) {
        if(prefixes[i] + 'MutationObserver' in window) {
          return window[prefixes[i] + 'MutationObserver'];
        }
      }
      return false;
    }());

    if(MutationObserver) {
      var mObserver = window.MutationObserver || window.WebKitMutationObserver || window.MozMutationObserver;

      // create an observer instance
      var targetContainer = document.querySelector('.js-wrap'),
          config = {
            childList: true,
            subtree: true
          };

      var targetFooter = document.querySelector('.js-footer-inner'),
          config = {
            attributes: true,
            childList: true,
            subtree: true,
          };

      var observer = new mObserver(function(mutations) {
          mutations.forEach(function(mutation) {
            handleLayoutPositioning();
          });
      });

      observer.observe(targetContainer, config);
      observer.observe(targetFooter, config);
    } else {
      setInterval(function() {
        handleLayoutPositioning();
      }, 1000);
    }
  };

  // Wraps tables in the container.
  // TODO: Remove if Edicy is going to wrap table with the container
  var wrapTables = function() {
    if (editmode === false) {
      $.each($('.content-formatted'), function() {
        if (!$(this).hasClass('js-custom-content-formatted')) {
          $(this).find('table').wrap('<div class="table-container overthrow"></div>');
        }
      });
    }
  };

  // Fallback for color scheme detection.
  var handleColorSchemeFallback = function() {
    color = $('.js-body-background-color').css('background-color');

    if (color === 'rgba(0, 0, 0, 0)' || color === 'transparent') {
      $(document).ready(function() {
        $('.js-background-type').addClass('dark-background').removeClass('light-background');
        $('.js-background-type').addClass('light-background').removeClass('dark-background');
      });
    } else if (color) {
      var getRGBA = function(colorStr) {
        if (!colorStr || typeof colorStr !== 'string') {
          return;
        }

        var arr = colorStr.match(/(\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*,?\s*([\d\.]+)?\s*)/);
        if (arr) {
          return {
            r: +arr[2],
            g: +arr[3],
            b: +arr[4],
            a: (arr[5]) ? +arr[5] : 1
          };
        }
      };

      var parsedColor = getRGBA(color),
      rgbAverage = parsedColor.r + parsedColor.g + parsedColor.b,
      alpha = parsedColor.a;

      if (rgbAverage + alpha > 0 && rgbAverage / 3 > 128) {
        $('.js-background-type').addClass('light-background').removeClass('dark-background');
      } else {
        $('.js-background-type').addClass('dark-background').removeClass('light-background');
      }
    }
  };

  var toggleFlags = function() {
    $('.js-option-toggle-flags').on('click', function(event) {
      event.stopPropagation();

      // Defines the flags visibility state variable.
      if ($(this).hasClass('js-flag-disable-btn')) {
        var FlagsState = false;
      } else {
        var FlagsState = true;
      }

      // Updates flags state in real time.
      $(this).toggleClass('js-flag-disable-btn');
      $('.js-header').toggleClass('flags-enabled flags-disabled');

      // Saves the flags state data to custom data.
      siteData.set("flags_state", FlagsState);
    });
  };

  // Returns the suitable version of the image depending on the viewport width.
  var getImageByWidth = function(sizes, targetWidth) {
    var prevImage;

    for (var i = 0, max = sizes.length; i < max; i++) {
      if (sizes[i].width < targetWidth) {
        return prevImage || sizes[i];
      }
      prevImage = sizes[i];
    }
    // Makes sure that smallest is returned if all images bigger than targetWidth.
    return sizes[sizes.length - 1];
  };

  var bgPickerImageSizesContains = function(sizes, url) {
    for (var i = sizes.length; i--;) {
      if (url.indexOf(sizes[i].url.trim()) > -1) {
        return true;
      }
    }
    return false;
  };

  // Checks the lightness sum of header background image and color and sets the lightness class depending on it's value.
  var bgPickerContentLightnessClass = function(bgPickerArea, combinedLightness) {
    if (combinedLightness > 0.6) {
      $(bgPickerArea).find('.js-background-type').addClass('light-background').removeClass('dark-background');
    } else {
      $(bgPickerArea).find('.js-background-type').addClass('dark-background').removeClass('light-background');
    }
  };

  // Header background image and color preview logic function.
  var bgPickerPreview = function(bgPickerArea, data, bgPicker, defaultImageColor) {
    // Defines the variables used in preview logic.

    var bgPickerImagePrevious = $(bgPickerArea).find('.js-background-image').css('background-image'),
        bgPickerImageSuitable = data.imageSizes ? getImageByWidth(data.imageSizes, $(window).width()) : null,
        bgPickerImage = (data.image && data.image !== '') ? 'url(' + bgPickerImageSuitable.url + ')' : 'none',
        bgPickerImageSizes = (data.imageSizes && data.imageSizes !== '') ? data.imageSizes : null,
        bgPickerColor = (data.color && data.color !== '') ? data.color : 'rgba(0,0,0,0)',
        bgPickerColorDataLightness = (data.colorData && data.colorData !== '') ? data.colorData.lightness : 1,
        colorExtractImage = $('<img>'),
        colorExtractCanvas = $('<canvas>'),
        colorExtractImageUrl = (data.image && data.image !== '') ? data.image : null;

    if (colorExtractImageUrl) {
      if (bgPickerImageSizesContains(bgPickerImageSizes, bgPickerImagePrevious)) {
        bgPicker.imageColor = bgPicker.imageColor ? bgPicker.imageColor : defaultImageColor;
        bgPicker.combinedLightness = getCombinedLightness(bgPicker.imageColor, bgPickerColor);
        bgPickerContentLightnessClass(bgPickerArea, bgPicker.combinedLightness);

      } else {
        colorExtractImage.attr('src', colorExtractImageUrl.replace(/.*\/(photos|voogstock)/g,'/photos'));
        colorExtractImage.on('load', function() {
          ColorExtract.extract(colorExtractImage[0], colorExtractCanvas[0], function(data) {
            bgPicker.imageColor = data.bgColor ? data.bgColor : 'rgba(255,255,255,1)';
            bgPicker.combinedLightness = getCombinedLightness(bgPicker.imageColor, bgPickerColor);
            bgPickerContentLightnessClass(bgPickerArea, bgPicker.combinedLightness);

          });
        });
      };
    } else {
      bgPicker.imageColor = 'rgba(255,255,255,1)';
      bgPicker.combinedLightness = getCombinedLightness(bgPicker.imageColor, bgPickerColor);
      bgPickerContentLightnessClass(bgPickerArea, bgPicker.combinedLightness);
    };

    // Updates the bgPickerContent background image and background color.
    $(bgPickerArea).find('.js-background-image').css({'background-image' : bgPickerImage});
    $(bgPickerArea).find('.js-background-color').css({'background-color' : bgPickerColor});
  };

  // Header background image and color save logic function.
  var bgPickerCommit = function(dataBgKey, data, bgPicker, pageType) {
    var commitData = $.extend(true, {}, data);
    commitData.image = data.image || '';
    commitData.imageSizes = data.imageSizes || '';
    commitData.color = data.color || '';
    commitData.combinedLightness = bgPicker.combinedLightness;

    if (pageType === 'articlePage') {
      Edicy.articles.currentArticle.setData(dataBgKey, commitData);
    } else {
      pageData.set(dataBgKey, commitData);
    }
  };

  var colorSum = function(bgColor, fgColor) {
    if (bgColor && fgColor) {
      if (typeof bgColor == 'string') {
        bgColor = bgColor.replace(/rgba?\(/,'').replace(/\)/,'').split(',');
        $.each(bgColor, function(n, x) {bgColor[n] = +x;});
      }
      if (typeof fgColor == 'string') {
        fgColor = fgColor.replace(/rgba?\(/,'').replace(/\)/,'').split(',');
        $.each(fgColor, function(n, x) {fgColor[n] = +x;});
      }
      if (typeof bgColor == 'object' && bgColor.hasOwnProperty('length')) {
        if (bgColor.length == 3) { bgColor.push(1.0); }
      }
      if (typeof fgColor == 'object' && fgColor.hasOwnProperty('length')) {
        if (fgColor.length == 3) { fgColor.push(1.0); }
      }
      var result = [0, 0, 0, 0];
      result[3] = 1 - (1 - fgColor[3]) * (1 - bgColor[3]);
      if (result[3] === 0) { result[3] = 1e-6; }
      result[0] = Math.min(fgColor[0] * fgColor[3] / result[3] + bgColor[0] * bgColor[3] * (1 - fgColor[3]) / result[3], 255);
      result[1] = Math.min(fgColor[1] * fgColor[3] / result[3] + bgColor[1] * bgColor[3] * (1 - fgColor[3]) / result[3], 255);
      result[2] = Math.min(fgColor[2] * fgColor[3] / result[3] + bgColor[2] * bgColor[3] * (1 - fgColor[3]) / result[3], 255);
      return $.map(result, function(e) { return Math.floor(e); });
    }
  };

  var getCombinedColor = function(bgColor, fgColor) {
    var sum = colorSum(bgColor || [255,255,255,1], fgColor || [255,255,255,1]);
    return sum;
  };

  var getCombinedLightness = function(bgColor, fgColor) {
    var combinedColor = getCombinedColor(bgColor, fgColor);
    var color = Math.round(((+combinedColor[0]) * 0.2126 + (+combinedColor[1]) * 0.7152 + (+combinedColor[2]) * 0.0722) / 2.55) / 100;
    return color;
  };

  var bgPickerColorScheme = function(lightness) {
    if (typeof lightness != 'undefined') {
      if (lightness > 0.6) {
        $('.header-wrapper').addClass('light').removeClass('dark');
      } else {
        $('.header-wrapper').addClass('dark').removeClass('light');
      }
    }
  };

  // ===========================================================================
  // Detects design editor changes.
  // ===========================================================================
  var detectDesignEditorChanges = function() {
    document.addEventListener('edicy:customstyles:change', function(event) {
      var relevantVariables = [
        '--header-mainmenu-font-size',
        '--header-mainmenu-line-height',
        '--header-mainmenu-line-height',
        '--font-two'
      ];

      var relevantVariableChanged = Object.keys(event.detail.changes).filter(function(variable) {
       return relevantVariables.indexOf(variable) > -1;
      }).length > 0;

      //
      if (relevantVariableChanged) {
        handleTopbarPosition();
      }
    });
  };

  // Initiates the functions when window is resized.
  var handleWindowResize = function() {
    $(window).resize(function() {
      $(window).resize(debounce(handleTopbarPosition, 500));
      $(window).resize(debounce(handleLayoutPositioning, 500));
      $(window).resize(debounce(handleSearchModalHeight, 500));
    });
  };

  // Initiations
  var initFrontPage = function() {
    // Add front page specific functions here.
  };

  var initCommonPage = function() {
    // Add common page specific functions here.
    handleTopbarPosition();
    detectDesignEditorChanges();
  };

  var initBlogPage = function() {
    // Add blog listing layout specific functions here.
    handleTopbarPosition();
    detectDesignEditorChanges();
  };

  var initPostPage = function() {
    // Add single post layout specific functions here.
    handleTopbarPosition();
    detectDesignEditorChanges();
  };

  var init = function() {
    // Add site wide functions here.
    if (bgPickerFallback) {
      handleColorSchemeFallback();
    };
    handleElementsClick();
    handleLayoutPositioning();
    handleContentMutations();
    handleSearchSubmit();
    focusFormWithErrors();
    handleWindowResize();
    wrapTables();
  };

  // ===========================================================================
  // Binds site search functionality.
  // ===========================================================================
  var bindSiteSearch = function(searchForm, languageCode, noResultsString) {
    if (searchForm) {
      var search = new VoogSearch(searchForm, {
        // This defines the number of results per query.
        per_page: 10,
        // Language code for restricting the search to page language.
        lang: languageCode,
        // If given, an DOM element results are rendered inside that element
        resultsContainer: $('.js-voog-search-modal').get(0),
        // Defines if modal should close on sideclick.
        sideclick: true,
        // Mobile checkpoint.
        mobileModeWidth: 640,
        // Updates results on every keypress.
        updateOnKeypress: true,
        // String for feedback if no results are found.
        noResults: noResultsString
      });
    } 
  };

  // Enables the usage of the initiations outside this file.
  // For example add "<script>site.initBlogPage();</script>" at the end of the "Blog & News" page to initiate blog listing view functions.
  window.site = $.extend(window.site || {}, {
    toggleFlags: toggleFlags,
    bgPickerPreview: bgPickerPreview,
    bgPickerCommit: bgPickerCommit,
    bgPickerColorScheme: bgPickerColorScheme,
    initFrontPage: initFrontPage,
    initCommonPage: initCommonPage,
    initBlogPage: initBlogPage,
    initPostPage: initPostPage,
    bindSiteSearch: bindSiteSearch
  });

  // Initiates site wide functions.
  init();
})(jQuery);
