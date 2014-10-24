;(function($) {
  var editmode = $('html').hasClass('editmode');

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

      $(this).addClass('open');
      $('.js-search-close-btn').addClass('open');
      $('.js-search').addClass('active');
      $('.js-search-input').val('').focus();
    });

    // Closes the search modal.
    $('.js-search-close-btn').click(function(event) {
      event.stopPropagation();
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

  // Reduces opacity of the gallery images that are not under the cursor.
  var handleGalleryHover = function() {
    $('.edys-gallery').mouseover(function() {
      $(this).find('.edys-gallery-item').addClass('inactive');
    });

    $('.edys-gallery').mouseout(function() {
      $(this).find('.edys-gallery-item').removeClass('inactive');
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
          $(topbar).css({'top' : 0});
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

  // Checks the presence of the table scrollbar.
  var checkScrollBar = function() {
    jQuery.fn.hasScrollBar = function(direction) {
      if (direction == 'vertical') {
        return this.get(0).scrollHeight > this.innerHeight();
      } else if (direction == 'horizontal') {
        return this.get(0).scrollWidth > this.innerWidth();
      }
      return false;
    }
  };

  // Adds horizontal scroll to tables that don't fit into the content area.
  var handleTableHorizontalScrolling = function() {
    $.each($('.table-container'), function() {
      if ($(this).hasScrollBar('horizontal') === true) {
        $(this).addClass('horizontal-scroll');
      } else {
        $(this).removeClass('horizontal-scroll');
      }
    });
  };

  // Initiates the functions when window is resized.
  var handleWindowResize = function() {
    $(window).resize(function() {
      handleTopbarPosition();
      handleContentMutations();
      handleTableHorizontalScrolling();
      handleSearchModalHeight();
    });
  };

    // Initiations
    var initFrontPage = function() {
      // Add front page specific functions here.
    };

    var initCommonPage = function() {
      // Add common page specific functions here.
      handleTopbarPosition();
    };

    var initBlogPage = function() {
      // Add blog listing layout specific functions here.
      handleTopbarPosition();
    };

    var initPostPage = function() {
      // Add single post layout specific functions here.
      handleTopbarPosition();
    };

    var init = function() {
      // Add site wide functions here.
      handleElementsClick();
      handleContentMutations();
      handleSearchSubmit();
      handleGalleryHover();
      focusFormWithErrors();
      handleWindowResize();
      wrapTables();

      if ($('.table-container').length > 0) {
        checkScrollBar();
        handleTableHorizontalScrolling();
      }
    };

    // Enables the usage of the initiations outside this file.
    // For example add "<script>site.initBlogPage();</script>" at the end of the "Blog & News" page to initiate blog listing view functions.
    window.site = $.extend(window.site || {}, {
      initFrontPage: initFrontPage,
      initCommonPage: initCommonPage,
      initBlogPage: initBlogPage,
      initPostPage: initPostPage
    });

    // Initiates site wide functions.
    init();
  })(jQuery);
