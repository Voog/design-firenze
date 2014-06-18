;(function($) {
  // Shows/hides the popover main menu (visible on smalles screens).
  var handleElementsToggle = function() {
    $('html').click(function() {
      if ($('.js-popover').hasClass('expanded')) {
        $('.js-popover').removeClass('expanded');
      }

      if ($('.js-modal-overlay').hasClass('active')) {
        $('.js-modal-overlay').removeClass('active');
      }
    });

    // Toggles the popover main menu (visible on smalles screens).
    $('.js-menu-btn').click(function(event) {
      event.stopPropagation();
      $(this).toggleClass('open');
      $('.js-menu-main').toggleClass('expanded');
    });

    // Toggles the popover language menu.
    $('.js-menu-lang-btn').click(function(event) {
      event.stopPropagation();
      $('.js-menu-lang-popover').toggleClass('expanded');
    });

    // Toggles the mobile search modal.
    $('.js-search-btn').click(function(event) {
      event.stopPropagation();
      $(this).toggleClass('open');
      $('.js-search').toggleClass('active');

      if ($('.js-modal-overlay').hasClass('active')) {
        $('.js-search-input').focus();
      }
    });

    // Prevents modal closing
    $('.js-modal').click(function(event) {
      event.stopPropagation();
    });
  };

  // Reduces opacity of the gallery images that are not under the cursor.
  var handleGalleryHover = function() {
    $('.edys-gallery-item').mouseover(function() {
      $(this).siblings('.edys-gallery-item').find('.edys-gallery-image').addClass('inactive');
    });

    $('.edys-gallery-item').mouseout(function() {
      $(this).siblings('.edys-gallery-item').find('.edys-gallery-image').removeClass('inactive');
    });
  };

  // Scrolls to the comment-form if comment submit failed (to show the error messages to the user).
  var focusCommentsWithErrors = function() {
    $(document).ready(function() {
      if ($('.form_field').hasClass('form_field_with_errors') === true) {
        $('html, body').scrollTop($('.comment-form').offset().top);
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

  // Sets the position of the footer to the bottom of the page
  var handleFooterPosition = function() {
    editmode = $('html').hasClass('editmode'),
    container = '.js-container',
    containerMiddle = '.js-container-middle',
    containerInner = '.js-container-inner',
    wrap = '.js-wrap',
    contentHeight = $('.js-wrap').height(),
    windowHeight = $(window).height(),
    footerHeight = $('.js-footer').height();

    if (editmode) {
      containerHeight = windowHeight - footerHeight - 40;
    } else  {
      containerHeight = windowHeight - footerHeight;
    }

    $(containerMiddle).css({
      'height': containerHeight - footerHeight,
      'padding-bottom': footerHeight
    });

    containerHeight = $(container).height();

    $(containerMiddle).css({
      'height': containerHeight - footerHeight,
      'padding-bottom': footerHeight
    });

    $(containerInner).css({
      'padding-top': footerHeight
    });
  };

  // Initiates the functions when footer content area is being edited.
  var handleFooterContentEdit = function() {
    $('.edy-texteditor-view').on('keydown', function() {
      handleFooterPosition();
    });
  };

  // Wraps tables in the container.
  // TODO: remove if edicy is going to wrap table with the container.
  var wrapTables = function() {
    $('.content-formatted table').wrap('<div class="table-container overthrow"></div>');
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

  var handleColorScheme = function() {
    color = $('.js-bgpicker-body-color').css('background-color');

    console.log(color);

    if (color === 'rgba(0, 0, 0, 0)' || color === 'transparent') {
      $(document).ready(function() {
        if ($('.backstretch').length > 0) {
          $('body').addClass('dark-background').removeClass('light-background');
        } else {
          $('body').addClass('light-background').removeClass('dark-background');
        }
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
        $('body').addClass('light-background').removeClass('dark-background');
      } else {
        $('body').addClass('dark-background').removeClass('light-background');
      }
    }
  };

  // Initiates the functions when window is resized.
  var handleWindowResize = function() {
    $(window).resize(function() {
      handleTopbarPosition();
      handleFooterPosition();
      handleFooterContentEdit();
      handleTableHorizontalScrolling();
    });
  };

    // Initiations
    var initFrontPage = function() {
      // Add front page specific functions here.
    };

    var initCommonPage = function() {
      // Add common page specific functions here.
      handleTopbarPosition();
      focusCommentsWithErrors();
    };

    var initBlogPage = function() {
      // Add blog listing layout specific functions here.
      handleTopbarPosition();
    };

    var initPostPage = function() {
      // Add single post layout specific functions here.
      handleTopbarPosition();
      focusCommentsWithErrors();
    };

    var init = function() {
      // Add site wide functions here.
      handleColorScheme();
      handleElementsToggle();
      handleFooterPosition();
      handleFooterContentEdit();
      handleGalleryHover();
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
      initPostPage: initPostPage,
      handleColorScheme: handleColorScheme
    });

    // Initiates site wide functions.
    init();
  })(jQuery);
