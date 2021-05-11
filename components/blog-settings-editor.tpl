{% if editmode %}
  <div class="btns-container">
    <button class="blog-settings-editor"></button>
  </div>
{% endif %}

{% editorjsblock %}
  <!-- Settings popover javascript. -->
  <script
    src="{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.js"
  ></script>

  <!-- Setings popover initiation. -->
  <script>
    var siteData = new Edicy.CustomData({
      type: 'site'
    });
    {% if site.data.article_settings %}
      var globalDataValues = {{ site.data.article_settings | json }};
    {% else %}
       var globalDataValues = {};
    {% endif %}
    var show_comments, show_dates;
    if (globalDataValues.show_comments != null && globalDataValues.show_comments !== '') {
      show_comments = Boolean(globalDataValues.show_comments);
    } else {
      show_comments = true;
    }
    if (globalDataValues.show_dates != null && globalDataValues.show_dates !== '') {
      show_dates = Boolean(globalDataValues.show_dates);
    } else {
      show_dates = true;
    }
    var valuesObj = {
      show_comments: show_comments,
      show_dates: show_dates
    }
    var siteSettingsButton = document.querySelector('.blog-settings-editor');
    var SettingsEditor = new Edicy.SettingsEditor(siteSettingsButton, {
        
      menuItems: [
        {
          "titleI18n": "comments",
          "type": "toggle",
          "key": "show_comments",
          "tooltipI18n": "toggle_all_articles_comments",
          "states": {
            "on": true,
            "off": false
          }
        },
        {
          "titleI18n": "publishing_date",
          "type": "toggle",
          "key": "show_dates",
          "tooltipI18n": "toggle_all_dates",
          "states": {
            "on": true,
            "off": false
          }
        }
      ],
       
      // Binded data object which should contain custom data object.
      values: valuesObj,
       // Style type the button.
      buttonStyle: 'default',
      // Title for the button.
      buttonTitleI18n: "blog_settings",
       preview: function(data) {
        var $articleDate = $('.post-date.site-data');
        if (data.show_dates == true) {
          $articleDate.removeClass('hide-article-date');
          $articleDate.addClass('show-article-date');
        } else if (data.show_dates == false) {
          $articleDate.removeClass('show-article-date');
          $articleDate.addClass('hide-article-date');
        }
      },
      commit: function(data) {
        siteData.set('article_settings', data);
      }
    });
  </script>
{% endeditorjsblock %}
