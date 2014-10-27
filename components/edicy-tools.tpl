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
        $('.js-background-type').removeClass('light-background dark-background');
        // Checks the opacity of the body background color and sets the lightness class depending on it's value.
        if (bodyBgColorOpacity >= 0.16) {
          $('.js-background-type').addClass(bodyBgColorLightness >= 0.2 ? 'light-background' : 'dark-background');
        } else {
          $('.js-background-type').addClass('light-background');
        };

        if (data.image === null || data.image === '') {
          $('.js-footer').removeClass('footer-gradient');
        } else {
          $('.js-footer').addClass('footer-gradient');
        }

        // Updades the body image only if it has been changed.
        // TODO: Add image sizes.
        var getPhotoByWidth = function(sizes, targetWidth) {
          var prevPhoto;
          for (var i = sizes.length; i--;) {
            if (sizes[i].width < targetWidth) {
              // Returns the previous image if current iteration size is smaller than targetWidth
              // Fallback to current if all images are smaller than currentWidth
              return prevPhoto || sizes[i];
            }
          }
          // makes sure that smallest is returned if all images bigger than targetWidth
          return sizes[sizes.length - 1]

        };

        var testime = getPhotoByWidth(data.imageSizes, $(window).width());

        console.log(data.imageSizes);
        console.log($(window).width());
        console.log(testime);



        // $('.js-body-background-image').css({'background-image' : bodyBgImage});

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

    var siteData = new Edicy.CustomData({
      type: 'site'
    });

    $('.js-option-toggle-flags').on('click', function(event) {
      event.stopPropagation();

      if ($(this).hasClass('js-flag-disable-btn')) {
        var FlagsState = false;
      } else {
        var FlagsState = true;
      }

      siteData.set("flags_state", FlagsState);

      $(this).toggleClass('js-flag-disable-btn');
      $('.js-menu-lang-wrap').toggleClass('flags-enabled flags-disabled');
    });
  </script>
{% endeditorjsblock %}
