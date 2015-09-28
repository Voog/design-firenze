{% editorjsblock %}
  <script src='{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.js'></script>
  <script>
    var siteData = new Edicy.CustomData({
      type: 'site'
    });

    // Initiates language flag toggleing functionality.
    site.toggleFlags();

    {% if post_page %}
      var pageType = 'articlePage';
    {% else %}
      var pageType = 'contentPage',

      pageData = new Edicy.CustomData({
        type: 'page',
        id: '{{ page.id }}'
      });
    {% endif %}

    $('.js-bg-picker-area').each(function(index, bgPickerArea) {
      var bgPickerButton = $(bgPickerArea).find('.js-background-settings'),
          dataBgKey = $(bgPickerButton).data('bg-key');

      var bgPicker = new Edicy.BgPicker(bgPickerButton, {
            picture: true,
            target_width: 600,
            color: true,
            showAlpha: true,

        preview: function(data) {
          site.bgPickerPreview($(bgPickerArea), data, bgPicker);
        },

        commit: function(data) {
          site.bgPickerCommit(dataBgKey, data, pageType);
        }
      });
    });
  </script>
{% endeditorjsblock %}
