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
  // Sets functions that will be initiated on items list layouts.
  // ===========================================================================
  var initItemsPage = function() {
    if (!editmode()) {
      bindContentItemImageLazyload();
    }
  };

// ===========================================================================
  // Toggles product categories visibility in main menu.
  // ===========================================================================
  var bindRootItemSettings = function(rootItemValuesObj) {
    if (!('show_product_related_pages_in_main_menu' in rootItemValuesObj)) {
      rootItemValuesObj.show_product_related_pages_in_main_menu = false;
    }

    $('.js-root-item-settings-toggle').each(function(index, languageMenuSettingsButton) {
      var rootItemSettingsEditor = new Edicy.SettingsEditor(languageMenuSettingsButton, {
        menuItems: [
          {
            "titleI18n": "show_in_main_menu",
            "type": "checkbox",
            "key": "show_product_related_pages_in_main_menu",
            "states": {
              "on": true,
              "off": false
            }
          }
        ],

        buttonTitleI18n: "settings",

        values: rootItemValuesObj,

        containerClass: ['js-root-item-settings-popover', 'js-prevent-sideclick'],

        preview: function(data) {
          if (!data.show_product_related_pages_in_main_menu === true) {
            $('.js-menu-item-products').addClass('is-hidden');
          } else {
            $('.js-menu-item-products').removeClass('is-hidden');
          }
        },

        commit: function(data) {
          siteData.set('settings_root_item', data);
        }
      });
    });
  };

  // ===========================================================================
  // Binds editmode image drop areas.
  // ===========================================================================
  var bindContentItemImgDropAreas = function(placeholderText) {
    $('.js-content-item-img-drop-area').each(function(index, imgDropAreaTarget) {
      var $imgDropAreaTarget = $(imgDropAreaTarget),
          $contentItemBox = $imgDropAreaTarget.closest('.js-content-item-box'),
          itemId = $contentItemBox.data('item-id'),
          itemType = $contentItemBox.data('item-type'),
          itemData = new Edicy.CustomData({
            type: itemType,
            id: itemId
          });

      var imgDropArea = new Edicy.ImgDropArea($imgDropAreaTarget, {
        positionable: false,
        target_width: 1280,
        placeholder: '<div class="edy-img-drop-area-placeholder">' + placeholderText + '</div>',
        removeBtn: '<div class="edy-img-drop-area-remove-image">' +
                      '<div class="edy-img-drop-area-remove-image-ico">' +
                        '<svg width="16" height="20" viewBox="0 0 26 30" xmlns="http://www.w3.org/2000/svg">' +
                          '<g fill-rule="nonzero" fill="currentColor">' +
                            '<g transform="translate(2 5)">' +
                              '<path d="M0 .997h2V21c0 1 1 2 2 2h14c1 0 2-1 2-2V1h2v20c0 2.25-1.75 4-4 4H4c-2.25 0-4-1.75-4-4V.997z"/>' +
                              '<rect x="10" y="4" width="2" height="16" rx="1"/>' +
                              '<rect x="5" y="4" width="2" height="16" rx="1"/>' +
                              '<rect x="15" y="4" width="2" height="16" rx="1"/>' +
                            '</g>' +
                            '<path d="M26 4v2H0V4h7V2c0-1 1-2 2-2h8c1 0 2 1 2 2v2h7zM9 4h8V3c0-.5-.5-1-1-1h-6c-.5 0-1 .5-1 1v1z"/>' +
                          '</g>' +
                        '</svg>' +
                      '</div>' +
                    '</div>',

        change: function(data) {
          var imageId;

          $imgDropAreaTarget
            .removeClass('is-cropped')
            .addClass('not-cropped')
            .css('opacity', .1)
          ;

          if (data) {
            imageId = data.original_id;

            $contentItemBox
              .removeClass('without-image is-loaded with-error')
              .addClass('with-image not-loaded')
            ;

            setImageOrientation($contentItemBox, data.width, data.height);
          } else {
            imageId = null;

            $contentItemBox
              .removeClass('with-image is-loaded with-error')
              .addClass('without-image not-loaded')
            ;

            $contentItemBox.find('.edy-img-drop-area-placeholder').css('opacity', 0);
          }

          setItemImage($contentItemBox, $imgDropAreaTarget, itemId, imageId, itemType);
        }
      });
    });
  };

  var setImageOrientation = function($contentItemBox, width, height) {
    var $imgDropAreaTarget = $contentItemBox.find('.js-content-item-img-drop-area'),
        $cropToggleButton = $contentItemBox.find('.js-toggle-crop-state');

    if (width > height) {
      $imgDropAreaTarget
        .removeClass('image-landscape image-square image-portrait')
        .addClass('image-landscape')
      ;
    } else if (width === height) {
      $imgDropAreaTarget
        .removeClass('image-landscape image-square image-portrait')
        .addClass('image-square')
      ;
    } else {
      $imgDropAreaTarget
        .removeClass('image-landscape image-square image-portrait')
        .addClass('image-portrait')
      ;
    }

    if ($imgDropAreaTarget.hasClass('image-square')) {
      $cropToggleButton
        .removeClass('is-visible')
        .addClass('is-hidden')
      ;
    } else {
      $cropToggleButton
        .removeClass('is-hidden')
        .addClass('is-visible')
      ;
    }
  };

  var setItemImage = function($contentItemBox, $imgDropArea, itemId, imageId, itemType) {
    var apiType = itemType === 'article' ? 'articles' : 'pages',
        itemData = new Edicy.CustomData({
          type: itemType,
          id: itemId
        });

    $.ajax({
       type: 'PATCH',
       contentType: 'application/json',
       url: '/admin/api/' + apiType +'/' + itemId,
       data: JSON.stringify({'image_id': imageId}),
       dataType: 'json',
       success: function(data) {
         itemData.set('image_crop_state', 'not-cropped');
         $contentItemBox.removeClass('not-loaded with-error').addClass('is-loaded');
         $contentItemBox.find('.edy-img-drop-area-placeholder').css('opacity', 1);
         $imgDropArea.css('opacity', 1);
       },
       timeout: 30000,
       error: function(data) {
         $contentItemBox.removeClass('not-loaded is-loaded with-error').addClass('with-error');
       }
    });
  };

  // ===========================================================================
  // Sets functions that will be initiated globally when resizing the browser
  // window.
  // ===========================================================================
  var bindContentItemImageCropToggle = function() {
    $('.js-toggle-crop-state').on('click', function() {
      var $contentItemBox = $(this).closest('.js-content-item-box'),
          $imgDropAreaTarget = $contentItemBox.find('.js-content-item-img-drop-area'),
          itemId = $contentItemBox.data('item-id'),
          itemType = $contentItemBox.data('item-type'),
          itemData = new Edicy.CustomData({
            type: itemType,
            id: itemId
          }),
          imageCropState;

      if ($imgDropAreaTarget.hasClass('is-cropped')) {
        $imgDropAreaTarget
          .removeClass('is-cropped')
          .addClass('not-cropped')
        ;

        imageCropState = 'not-cropped';
      } else {
        $imgDropAreaTarget
          .removeClass('not-cropped')
          .addClass('is-cropped')
        ;

        imageCropState = 'is-cropped';
      }

      itemData.set('image_crop_state', imageCropState);
    });
  };

  // ===========================================================================
  // Load article cover images only when they are close or appearing in the
  // viewport.
  // ===========================================================================
  var bindContentItemImageLazyload = function() {
    $(document).ready(function() {
      setTimeout(function() {
        $('.js-content-item-box').addClass('not-loaded');
      }, 3000);
    });

    $('.js-lazyload').lazyload({
      threshold : 500,
      effect : "fadeIn",
      placeholder: 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==',

      load: function() {
        var $contentItemBox = $(this).closest('.js-content-item-box');

        $contentItemBox.removeClass('not-loaded with-error').addClass('is-loaded');

        setTimeout(function() {
          $contentItemBox.removeClass('not-loaded with-error');
          $contentItemBox.find('.js-loader').remove();
        }, 3000);
      }
    });
  };

  // ===========================================================================
  // Function to detect if site is displayed in editmode.
  // ===========================================================================
  var editmode = function () {
    return $('html').hasClass('editmode');
  };

  // ===========================================================================
  // Sets header menu initial width attribute for menu mode calculation.
  // ===========================================================================
  var setHeaderMenuInitialWidth = function() {
    var $headerMenu = $('.js-header-menu');

    $headerMenu.attr('data-initial-width', $headerMenu.outerWidth(true));  };

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
    initItemsPage: initItemsPage,
    // Initiations for specific functions.
    bindRootItemSettings: bindRootItemSettings,
    bindContentItemImgDropAreas: bindContentItemImgDropAreas,
    bindContentItemImageCropToggle: bindContentItemImageCropToggle,
    bindSiteSearch: bindSiteSearch
  });

  // Initiates site wide functions.
  init();
})(jQuery);
