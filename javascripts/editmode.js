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

var initSettingsEditorBtn = function() {
window.addEventListener('DOMContentLoaded', function(event) {
  var shadowDom = document.querySelector(".edy-next-shadowdom").shadowRoot;
  var setSettingsBtn = setInterval(function() {
    if (shadowDom.querySelectorAll('div[class^="toolbar__"]').length) {
      var toolbarExpandBtn = shadowDom.querySelector('div[class^="toolbar-expand"]');
      var toolbar = shadowDom.querySelector('div[class^="toolbar__"]');
      var settingsBtn = document.querySelector(".js-layout_settings-btn");
      var toolbarItem = shadowDom.querySelector('div[class^="toolbar-content-item__"]');

      settingsBtn.className = toolbarItem.className + ' ' + settingsBtn.className;

      toolbar.insertBefore(settingsBtn, toolbarExpandBtn);

      shadowDom.querySelector(".js-layout_settings-btn").addEventListener(
        "click", function(e){
          if (document.querySelector('body').classList.contains('layout_settings-visible')) {
            $('div.editor_default').attr('style', display = 'none')
          }
          document.querySelector('body').classList.toggle('layout_settings-visible');
          e.stopImmediatePropagation();
        }
      );

      var positionPopover = function() {
        var settingsPopover = $('.js-layout_settings-popover');
        var settingsPopoverArrow = $('.layout_settings-arrow');

        if ($( window ).width() > 768) {
          settingsPopover.css({right: window.innerWidth - settingsBtn.getBoundingClientRect().right - (settingsPopover.width() / 2)})
          settingsPopoverArrow.css({right: settingsPopover.width() / 2});
        } else {
          settingsPopover.css({right: 0});
          settingsPopoverArrow.css({right: 72});
        }
      }

      $(window).resize(debounce(function() {
        positionPopover();
      }, 25));

      positionPopover();
      clearInterval(setSettingsBtn);
    }
  }, 500);

  $('body').append($('.js-layout_settings-popover'));
});
}

window.site = $.extend(window.site || {}, {
  initSettingsEditorBtn: initSettingsEditorBtn
})
