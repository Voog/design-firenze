;(function($) {
  // SHOWS/HIDES THE POPOVER MAIN MENU (VISIBLE ON SMALLES SCREENS)
  var toggleMainMenu = function() {
    $('.js-menu-btn').click(function() {
      $(this).toggleClass('open');
      $('.js-menu-main').toggleClass('expanded');
    });
  };

  // SWITCHES THE SITE LANGUAGE TO THE SELECTED VALUE FROM THE LANGUAGE MENU
  var toggleLangMenu = function() {
    $('.js-menu-lang-btn').click(function(event) {
      event.stopPropagation();
      $('.js-menu-lang-popover').toggleClass('expanded');
    });
  };

  // HIDES THE POPOVER MAIN MENU IF CICKED ANYWHERE ELSE THAN THE MENU ITSELF (VISIBLE ON SMALLES SCREENS)
  var handlePopoverMenuHide = function() {
    $('html').click(function() {
      if ($('.js-menu-lang-popover').hasClass('expanded')) {
        $('.js-menu-lang-popover').removeClass('expanded');
      }
    });
  };

  // REDUCES OPACITY OF THE GALLERY IMAGES THAT ARE NOT UNDER THE CURSOR
  var handleGalleryHover = function() {
    $('.edys-gallery-item').mouseover(function() {
      $(this).siblings('.edys-gallery-item').find('.edys-gallery-image').addClass('inactive');
    });

    $('.edys-gallery-item').mouseout(function() {
      $(this).siblings('.edys-gallery-item').find('.edys-gallery-image').removeClass('inactive');
    });
  };

  // HIDES THE FORM FIELD ERROR WHEN THE FIELD IS FOCUSED
  var handleFormFieldClick = function() {
    $('.form_field_with_errors').click(function() {
      $(this).removeClass('form_field_with_errors');
    });
  };

  // SCROLLS TO THE COMMENT-FORM IF COMMENT SUBMIT FAILED (TO SHOW THE ERROR MESSAGES TO THE USER)
  var focusCommentsWithErrors = function() {
    $(document).ready(function() {
      if ($('.form_field').hasClass('form_field_with_errors') === true) {
        $('html, body').scrollTop($('.comment-form').offset().top);
      }
    });
  };

  // TODO: Remove if Edicy is going to wrap table with the container
  var wrapTables = function() {
    $('.content-formatted table').wrap('<div class="table-container overthrow"></div>');
  };

  // TODO: Add comment
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

  // ADDS HORIZONTAL SCROLL TO TABLES THAT DON'T FIT INTO THE CONTENT AREA
  var handleTableHorizontalScrolling = function() {
    $.each($('.table-container'), function() {
      if ($(this).hasScrollBar('horizontal') === true) {
        $(this).addClass('horizontal-scroll');
      } else {
        $(this).removeClass('horizontal-scroll');
      }
    });
  };

  // INITIATES THE TABLE HORISONTAL SCROLL FUNCTION WHEN WINDOW IS RESIZED
  var handleWindowResize = function() {
    $(window).resize(function() {
      handleTableHorizontalScrolling();
    });
  };

    // Initiations
    var initBlogPage = function() {
      // ADD BLOG LISTING VIEW SPECIFIC FUNCTIONS HERE
    };

    var initArticlePage = function() {
      // ADD SINGLE POST VIEW SPECIFIC FUNCTIONS HERE
      handleFormFieldClick();
      focusCommentsWithErrors();
    };

    var initCommonPage = function() {
      // ADD COMMON PAGE SPECIFIC FUNCTIONS HERE
      handleFormFieldClick();
      focusCommentsWithErrors();
    };

    var init = function() {
      // ADD SITE WIDE FUNCTIONS HERE
      toggleMainMenu();
      toggleLangMenu();
      handlePopoverMenuHide();
      handleGalleryHover();
      handleWindowResize();
      wrapTables();
      if ($('.table-container').length > 0) {
        checkScrollBar();
        handleTableHorizontalScrolling();
      }
    };

    // ENABLES THE USAGE OF THE INITIATIONS OUTSIDE THIS FILE
    window.site = $.extend(window.site || {}, {
      initBlogPage: initBlogPage,
      initArticlePage: initArticlePage,
      initCommonPage: initCommonPage
    });

    init();
  })(jQuery);
