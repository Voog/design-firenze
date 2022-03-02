{% editorjsblock %}
  <script src='{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.js'></script>
  
  {% if _isSettingsEditor == true %}
    {% include "settings-editor" %}
  {% endif %}

  <script>
    var siteData = new Edicy.CustomData({
      type: 'site'
    });

    {% if items_page %}
      site.bindContentItemImgDropAreas('{{ "drag_picture_for_product_here" | lc: editor_locale | escape }}');
      site.bindContentItemImageCropToggle();

      {%if site.data.settings_root_item %}
        rootItemValuesObj = {{ site.data.settings_root_item | json }};
      {% else %}
        rootItemValuesObj = {};
      {% endif %};

      site.bindRootItemSettings(rootItemValuesObj);
    {% endif %}

    // Initiates language flag toggleing functionality.
    site.toggleFlags();

    {% if post_page %}
      var pageType = 'articlePage';
    {% elsif product_page %}
      var pageType = 'productPage';
    {% else %}
      var pageType = 'contentPage',

      pageData = new Edicy.CustomData({
        type: 'page',
        id: '{{ page.id }}'
      });
    {% endif %}

    $('.js-bg-picker-area').each(function(index, bgPickerArea) {
      var bgPickerButton = $(bgPickerArea).find('.js-background-settings'),
          dataBgKey = $(bgPickerButton).data('bg-key'),
          defaultImageColor = $(bgPickerButton).data('bg-default-image-color'),
          pictureBoolean = $(bgPickerButton).data('bg-picture-boolean'),
          targetWidth = $(bgPickerButton).data('target-width');

      var bgPicker = new Edicy.BgPicker(bgPickerButton, {
            picture: pictureBoolean,
            target_width: targetWidth,
            color: true,
            showAlpha: true,

        preview: function(data) {
          site.bgPickerPreview($(bgPickerArea), data, bgPicker, defaultImageColor);
        },

        commit: function(data) {
          site.bgPickerCommit(dataBgKey, data, bgPicker, pageType);
        }
      });
    });
  </script>
{% endeditorjsblock %}
