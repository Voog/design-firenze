;(function($) {
  // Shows/hides the popover main menu (visible on smalles screens).
  var toggleMainMenu = function() {
    $('.js-menu-btn').click(function() {
      $(this).toggleClass('open');
      $('.js-menu-main').toggleClass('expanded');
    });
  };

  // Shows/hides the popover language menu.
  var toggleLangMenu = function() {
    $('.js-menu-lang-btn').click(function(event) {
      event.stopPropagation();
      $('.js-menu-lang-popover').toggleClass('expanded');
    });
  };

  // Shows/hides the popover tags menu.
  var toggleTagsMenu = function() {
    $('.js-tags-btn').click(function(event) {
      event.stopPropagation();
      $(this).toggleClass('open');
      $('.js-menu-tags').toggleClass('expanded');
    });
  };

  // Hides the popover main menu if clicked anywhere else than the menu itself (visible on smalles screens).
  var handlePopoverMenuHide = function() {
    $('html').click(function() {
      if ($('.js-menu-lang-popover').hasClass('expanded')) {
        $('.js-menu-lang-popover').removeClass('expanded');
      }
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

  // Positions footer on front page layout.
  var handleFooterPosition = function() {
    windowHeight = $(window).height();
    footerHeight = $('.js-footer').height();

    $('.js-wrap-inner').css({
      'padding-top' : footerHeight / 2,
      'padding-bottom' : footerHeight / 2,
    });

    contentHeight = $('.js-wrap').innerHeight();

    console.log('windowHeight: ' + windowHeight);
    console.log('footerHeight: ' + footerHeight);
    console.log('contentInnerHeight: ' + contentHeight);

    if (windowHeight <= contentHeight) {
      $('.js-body').addClass('static');
    } else {
      $('.js-body').removeClass('static');
    }
  };

  var handleFrontPageContentEdit = function() {
    console.log('initeds');
    $('.edy-editable').keypress(function() {
      handleFooterPosition();
      console.log('jes');
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

  // Initiates the functions when window is resized.
  var handleWindowResize = function() {
    $(window).resize(function() {
      handleTopbarPosition();
      handleFooterPosition();
      handleTableHorizontalScrolling();
    });
  };

    // Initiations
    var initBlogPage = function() {
      // Add blog listing layout specific functions here.
      handleTopbarPosition();
      toggleTagsMenu();
    };

    var initArticlePage = function() {
      // Add single post layout specific functions here.
      handleTopbarPosition();
      toggleTagsMenu();
      focusCommentsWithErrors();
    };

    var initCommonPage = function() {
      // Add common page specific functions here.
      handleTopbarPosition();
      focusCommentsWithErrors();
    };

    var initFrontPage = function() {
      // Add front page specific functions here.
      handleFrontPageContentEdit();
      handleFooterPosition();
    };

    var init = function() {
      // Add site wide functions here.
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

    // Enables the usage of the initiations outside this file.
    // For example add "<script>site.initBlogPage();</script>" at the end of the "Blog & News" page to initiate blog listing view functions.
    window.site = $.extend(window.site || {}, {
      initBlogPage: initBlogPage,
      initArticlePage: initArticlePage,
      initCommonPage: initCommonPage,
      initFrontPage: initFrontPage
    });

    // Initiates site wide functions.
    init();
  })(jQuery);
