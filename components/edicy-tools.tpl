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

    var bodyBg = new Edicy.BgPicker($('.js-body-background-settings'), {
      picture: true,
      target_width: 600,
      color: true,
      showAlpha: true,

      preview: function(data) {
        var bodyBgImage = (data.image && data.image !== '') ? 'url(' + data.image + ')' : 'none',
            bodyBgColor = (data.color && data.color !== '') ? data.color : 'transparent',
            bodyBgColorOpacity = (data.colorData && data.colorData !== '') ? data.colorData.a : 'none',
            bodyBgColorLightness = (data.colorData && data.colorData !== '' && data.colorData.lightness) ? data.colorData.lightness : 'none';

        // removes the current lightness class.
        $('.js-body').removeClass('light-background dark-background');
        // Checks the opacity of the body background color and sets the lightness class depending on it's value.
        var frontPage = $('body').hasClass('front-page');
        if (frontPage == true && bodyBgColorOpacity >= 0.16) {
          $('.js-body').addClass(bodyBgColorLightness >= 0.2 ? 'light-background' : 'dark-background');
        } else if (frontPage == true) {
          $('.js-body').addClass('light-background');
        };

        // Updades the body image only if it has been changed.
        // TODO: Add image sizes.
        $('.js-body-background-image').css({'background-image' : bodyBgImage});
        // {% if page.data.body_bg.imageSizes %}
        //   var imageSizes = {{ page.data.body_bg.imageSizes | json }};
        //   console.log(imageSizes);

        //   jQuery.each(imageSizes, function(index, value) {

        //   });
        // {% endif %}

        // Updates the body background color.
        $('.js-body-background-color').css({'background-color' : bodyBgColor});
      },

      commit: function(data) {
        var commitData = $.extend(true, {}, data);

        commitData.image = commitData.image || '';
        commitData.color = commitData.color || 'transparent';

        {% if bg-picker == "article" %}
          Edicy.articles.currentArticle.setData("body_bg", commitData);
        {% else %}
          pageData.set("body_bg", commitData);
        {% endif %}
      }
    });
  </script>
{% endeditorjsblock %}
