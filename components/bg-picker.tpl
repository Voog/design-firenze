{% editorjsblock %}
  <script src='/assets/admin/tools/0.1.3/edicy-tools.js'></script>
  <script>
    // Body background image and color data preview and save logic
    {% if bg-picker == "article" %}
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
            col = (data.color && data.color !== '') ? data.color : 'none';

        $('.js-bgpicker-body-color').css({'background' : col});

        if (data.image === null || data.image === '') {
          $('.backstretch').remove();
          $('.js-footer').removeClass('footer-gradient');
        } else {
          $.backstretch(data.image);
          $('.js-footer').addClass('footer-gradient');
        }

        {% if editmode %}site.handleColorScheme();{% endif %}
      },

      commit: function(data) {
        {% if bg-picker == "article" %}
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
