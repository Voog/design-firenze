{% editorjsblock %}
  <script src='{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.js'></script>
  <script>
    // Body background image and color data preview and save logic
    {% if edicy-tools == "article" %}
      var articleData = new Edicy.CustomData({
        type: 'article',
        id: '{{ article.id }}'
      });
    {% else %}
      var pageData = new Edicy.CustomData({
        type: 'page',
        id: '{{ page.id }}'
      });
    {% endif %}

    var bgPickerBody = new Edicy.BgPicker($('.js-bgpicker-body-settings'), {
      picture: true,
      color: true,
      showAlpha: true,

      preview: function(data) {
        var img = (data.image && data.image !== '') ? 'url("' + data.image + '")' : 'none',
            oldImg = $('.js-bgpicker-body-image').css('background-image'),
            col = (data.color && data.color !== '') ? data.color : 'none';

        // Updades the header image only if it has been changed.
        if (oldImg !== img) {
          $('.js-bgpicker-body-image').css({'background-image' : img});
        }
        $('.js-bgpicker-body-color').css({'background' : col});

        if (data.image === null || data.image === '') {
          $('.js-footer').removeClass('footer-gradient');
        } else {
          $('.js-footer').addClass('footer-gradient');
        }

        {% if editmode %}site.handleColorScheme();{% endif %}
      },

      commit: function(data) {
        {% if edicy-tools == "article" %}
          articleData.set({
        {% else %}
          pageData.set({
        {% endif %}
          'body_image': data.image || '',
          'body_color': data.color || ''
        });
      }
    });
  </script>
{% endeditorjsblock %}
