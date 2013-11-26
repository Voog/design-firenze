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
			$('.mobile-menu-wrap .menu').slideToggle('fast');
		});
	};

	var handleWindowResize = function() {
		$(window).resize(function() {
			if ($(window).width() > 900) {
				$('.mobile-menu-wrap .menu').hide();
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
		scrollCount  = 0;
		lastScrollTop = 0;
		$(document).scroll(function(event){
			console.log(scrollCount);
			scrollCount++;
			console.log(scrollCount);
			setTimeout(function() {
				scrollCount = 0;
			}, 500);
			if (scrollCount > 5) {
				$('.top-bar').show();
				scrollTop = $(this).scrollTop();
				if (scrollTop > lastScrollTop){
					setTimeout(function() {
						$('.top-bar').removeClass('visible');
						$('.top-bar-btn').removeClass('expanded');
						$('.tags-menu').removeClass('visible');
					}, 100);
				} else {
					if ($(window).scrollTop() > 50) {
						setTimeout(function() {
							$('.top-bar').addClass('visible');
						}, 100);
					} else {
						setTimeout(function() {
							$('.top-bar').removeClass('visible');
						}, 100);
					}
				}
				lastScrollTop = scrollTop;
			} else {
				console.log("it is not");
			}
		});
	};

	var handleTopBarBtn = function() {
		$('.top-bar-btn').click(function() {
			$(this).toggleClass('expanded');
			$('.tags-menu').toggleClass('visible');
		});
	};

	var init = function() {
		handleLangMenuClick();
		handleMobileMenuClick();
		handleWindowResize();
		handlePopoverMenuHide();
		handleTopBar();
		handleTopBarBtn();
	};

	init();

})(jQuery);