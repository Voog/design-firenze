<script>
  function initSettingsEditor(options = {}) {
    var entityData;
    if (options.entityData === 'siteData') {
      var entityData = new Edicy.CustomData({
        type: 'site'
      });;
    } else if (options.entityData === 'articleData') {
      var entityData = new Edicy.CustomData({
        type: 'article',
        id: '{{article.id}}'
      });
    } else {
      var entityData = new Edicy.CustomData({
        type: 'page',
        id: '{{page.id}}'
      });
    }
    var SettingsEditor = new Edicy.SettingsEditor(options.settingsBtn, {
      menuItems: options.menuItems,
      values: options.values || options.defaultValues,
      buttonTitleI18n: options.buttonTitleI18n,
      buttonActiveClass: 'active',
      containerClass: options.containerClass || 'editor_default',
      preview: function(data) {
        options.prevFunc && options.prevFunc(data);
      },
      commit: function(data) {
        entityData.set(options.dataKey, data, {
          success: function() {
            if (options.noReload !== true) {
              window.location.reload();
            }
          }
        });
      }
    });
    options.settingsBtn.removeAttribute('disabled');
    $('.edy-settings-editor:not(.editor_default)').each(function() {
      if ($(this).find('.layout_settings-close').length <= 0) {
        $(this).prepend('<div class="layout_settings-close"></div>');
      }
    });
    $('.layout_settings-close').click(function() {
      $('body').trigger('click');
    });
    $('.js-settings-editor-btn').click(function() {
      if ($(':not(.editor_default) .edy-settings-editor-inner-title').length >= 1) {
        $('.edy-settings-editor-inner-title').text($(this).find('.edy-cbtn-content .p14.bold').text())
      } else {
        $('.edy-settings-editor:not(.editor_default) .edy-settings-editor-inner').prepend(
          '<h3 class="edy-settings-editor-inner-title" style="padding: 0 32px;margin-bottom: 0;">' + $(this).find('.edy-cbtn-content .p14.bold').text() + '</h3>'
        );
      }
    });
  }
  {% if editmode %}
    site.initSettingsEditorBtn();
  {% endif %}
</script>
