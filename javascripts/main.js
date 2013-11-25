;(function($) {
	var handleLangMenuClick = function() {
		$(".lang-btn").click(function(event) {
			event.stopPropagation();
			$(".lang-menu-popover").toggleClass("visible");
			if ($(".lang-menu-popover").hasClass("visible")) {
				$(".lang-menu-popover").fadeIn("fast");
			} else {
				$(".lang-menu-popover").fadeOut("fast");
			}
		});
	};

	var handleMobileMenuClick = function() {
		$(".mobile-menu-btn-wrap").click(function() {
			$(".mobile-menu-wrap .menu").slideToggle("fast");
		});
	};

	var handleWindowResize = function() {
		$(window).resize(function() {
			if ($(window).width() > 900) {
				$(".mobile-menu-wrap .menu").hide();
			}
		});
	};

	var handlePopoverMenuHide = function() {
		$('html').click(function() {
			if ($(".lang-menu-popover").hasClass("visible")) {
				$(".lang-menu-popover").removeClass("visible").fadeOut("fast");
			}
		});
	};

	var init = function() {
		handleLangMenuClick();
		handleMobileMenuClick();
		handleWindowResize();
		handlePopoverMenuHide();
	};

	init();

})(jQuery);