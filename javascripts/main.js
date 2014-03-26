;(function($) {
	var toggleMainMenu = function() {
        $('.js-menu-btn').click(function() { //TODO: Change the class name
            $(this).toggleClass('open');
            $('.js-main-menu').toggleClass('expanded');
        });
	};
  
    var toggleLangMenu = function() {
        $('.js-lang-menu-btn').click(function(event) {
            event.stopPropagation();
            $('.js-lang-menu-popover').toggleClass('expanded');
        });
    };
    
    var toggleTagsMenu = function() {
        $('.js-tags-btn').click(function(event) {
            event.stopPropagation();
            $(this).toggleClass('open');
            $('.js-tags-menu').toggleClass('expanded');
        });
    }
    
	var handlePopoverMenuHide = function() {
		$("html").click(function() {
            if ($(".js-lang-menu-popover").hasClass("expanded")) {
                $(".js-lang-menu-popover").removeClass("expanded");
            }
            if ($(".js-tags-menu").hasClass("expanded")) {
                $('.js-tags-btn').removeClass('open');
                $(".js-tags-menu").removeClass("expanded");
            }
		});
	};
	
	var handleTopbarPosition = function() {
        var startScroll,
            toHandler,
            endScroll,
            scrolled,
            container = $('.js-container'),
            topbar = $('.js-topbar'),
            header = $('.js-header'),
            tagsMenu = $('.js-tags-menu'),
            topbarHeight = $(topbar).outerHeight() + 6, //TODO: Check why this magic number 6 is needed.
            topbarVisibleArea = $(header).outerHeight() + 150,
            tagsMenuHeight = $(tagsMenu).outerHeight();

            
        $(topbar).css({'top' : -topbarHeight});
        
        $(window).on("scroll", function(){
            if (!startScroll) {
                startScroll = $(window).scrollTop();
            } else {
                endScroll = $(window).scrollTop(); 
                scrolled = endScroll - startScroll;
                
                if (scrolled < -5 && startScroll > topbarVisibleArea) {
                    $(topbar).css({'top' : 0});
                } else if ((scrolled < 0 && startScroll < topbarVisibleArea) || (scrolled > 0 && startScroll > topbarVisibleArea)) {
                    if (tagsMenu.hasClass('expanded')) {
                        $(topbar).css({'top' : -topbarHeight - tagsMenuHeight});
                    } else {
                        $(topbar).css({'top' : -topbarHeight});
                    }
                }
                
                startScroll = 0;
            }
        });
	};
    
    var handleFormFieldClick = function() {
        $('.form_field_with_errors').click(function() {
            $(this).removeClass('form_field_with_errors');
        });
    };
    
    var focusCommentsWithErrors = function() {
      $(document).ready(function() {
        if ($('.comment-form').hasClass('form_with_errors') === true) {
          $("html, body").scrollTop($('.comment-form').offset().top);
        }
      });
    };
    
	var wrapTables = function() {
        $('.content-formatted table').wrap('<div class="table-container overthrow"></div>');
	};
	
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
	
	var handleTableHorizontalScrolling = function() {
        $.each($('.table-container'), function() {
            if ($(this).hasScrollBar('horizontal') === true) {
                $(this).addClass('horizontal-scroll');
            } else {
                $(this).removeClass('horizontal-scroll');
            }
        });
	};
	
	var handleWindowResize = function() {
        $(window).resize(function() {
            handleTableHorizontalScrolling();
        });
	};
	
    // Initiations
    var initBlogPage = function() {
    };
    
    var initArticlePage = function() {
        handleFormFieldClick();
        focusCommentsWithErrors();
    };
    
    var init = function() {
        toggleMainMenu();
        toggleLangMenu();
        toggleTagsMenu();
        handlePopoverMenuHide();
        handleTopbarPosition();
        handleWindowResize();
        wrapTables();
        if ($('.table-container').length > 0) {
            checkScrollBar();
            handleTableHorizontalScrolling();
        }
    };
    
    window.site = $.extend(window.site || {}, {
        initBlogPage: initBlogPage,
        initArticlePage: initArticlePage,
        handleFormFieldClick: handleFormFieldClick
    });
    
    init();
})(jQuery);