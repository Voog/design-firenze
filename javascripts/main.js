;(function($) {
	var handleLangMenuClick = function() {
		$('.lang-btn').click(function(event) {
			event.stopPropagation();
			$('.lang-menu-popover').toggleClass('visible');
			if ($('.lang-menu-popover').hasClass('visible')) {
				$('.lang-menu-popover').fadeIn('fast');
			} else {
				$('.lang-menu-popover').fadeOut('fast');
			}
		});
	};

	var handleMobileMenuClick = function() {
		$('.mobile-menu-btn-wrap').click(function() {
			$('.cp-header .cp-main-menu').slideToggle('fast').toggleClass('expanded');
		});
	};

	var handleWindowResize = function() {
		$(window).resize(function() {
			if ($(window).width() <= 480) {
			    if (!$('.cp-header .cp-main-menu').hasClass('expanded')) {
                    $('.cp-header .cp-main-menu').hide();
			    }
			} else {
			    $('.cp-header .cp-main-menu').show();
			}
		});
	};

	var handlePopoverMenuHide = function() {
		$('html').click(function() {
			if ($('.lang-menu-popover').hasClass('visible')) {
				$('.lang-menu-popover').removeClass('visible').fadeOut('fast');
			}
		});
	};

	var handleTopBar = function() {
		lastScrollTop = 0;
		topBarHeight = $('.top-bar').height();
		$('.top-bar').css('top',-topBarHeight);
		console.log(topBarHeight);
		$(document).scroll(function(event){
		    $('.top-bar').show();
            scrollTop = $(this).scrollTop();
			if (scrollTop > lastScrollTop) {
				$('.top-bar').removeClass('visible').css('top',-topBarHeight);
				$('.top-bar-btn').removeClass('expanded');
				$('.tags-menu').removeClass('visible');
			} else {
				if ($(window).scrollTop() > 50) {
					$('.top-bar').addClass('visible').css('top','0');
				} else {
					$('.top-bar').removeClass('visible');
				}
			}
			lastScrollTop = scrollTop;
		});
	};
	
	var handleSmoothScrolling = function() {
        $('a[href^="#"]').click(function() {  
            target = $(this.hash);  
            if (target.length == 0) target = $('a[name="' + this.hash.substr(1) + '"]');  
                if (target.length == 0) target = $('html');  
                    $('html, body').animate({ scrollTop: target.offset().top }, 500);  
                    return false;  
                }); 
	    };

	var handleTopBarBtn = function() {
		$('.top-bar-btn').click(function() {
			$(this).toggleClass('expanded');
			$('.tags-menu').toggleClass('visible');
			$('.tags-menu.visible').css('top',$('.top-bar-btn').height());
		});
	};

	var handleCheckboxClick = function() {
		$(".form_field_label").click(function() {
			$(this).toggleClass("checked");
		});
	};

	var handleRadioClick = function() {
		$(".radio_label").click(function() {
			$(".radio_label").removeClass("checked");
			$(this).addClass("checked");
		});
	};

	var init = function() {
		handleLangMenuClick();
		handleMobileMenuClick();
		handleWindowResize();
		handlePopoverMenuHide();
		handleTopBar();
		handleTopBarBtn();
		handleCheckboxClick();
		handleRadioClick();
		handleSmoothScrolling();
	};

	init();

})(jQuery);