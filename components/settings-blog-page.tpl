{% include 'settings-editor-button',
  _titleKey: "blog",
  _descriptionKey: "edit_blog_settings",
  _className: "js-blog-settings-editor",
  _wrapClassName: "content_settings-btn"
%}

<script>
  window.addEventListener('DOMContentLoaded', function(event) {
    {% if site.data.article_settings %}
      var globalDataValues = {{ site.data.article_settings | json }};
    {% else %}
      var globalDataValues = {};
    {% endif %}

    var show_comments, show_dates;
    if (globalDataValues.show_comments != null && globalDataValues.show_comments !== '') {
      show_comments = Boolean(globalDataValues.show_comments)
    } else {
      show_comments = true;
    }

    if (globalDataValues.show_dates != null && globalDataValues.show_dates !== '') {
      show_dates = Boolean(globalDataValues.show_dates)
    } else {
      show_dates = true;
    }

    var valuesObj = {
      show_comments: show_comments,
      show_dates: show_dates
    }

    initSettingsEditor(
      {
        settingsBtn: document.querySelector('.js-blog-settings-editor'),
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
        dataKey: 'article_settings',
        values: valuesObj,
        entityData: 'siteData',
        noReload: true,
        containerClass: ['bottom-settings-popover', 'first', 'editor_default'],
        prevFunc: function(data) {
          var $articleDate = $('.post-date.site-data'),
              $articleComments = $('.comments');
          if (data.show_dates == true) {
            $articleDate.removeClass('hide-article-date');
            $articleDate.addClass('show-article-date');
          } else if (data.show_dates == false) {
            $articleDate.removeClass('show-article-date');
            $articleDate.addClass('hide-article-date');
          }
          if (data.show_comments == true) {
            $articleComments.removeClass('hide-article-comments');
            $articleComments.addClass('show-article-comments');
          } else if (data.show_authors == false) {
            $articleComments.removeClass('show-article-comments');
            $articleComments.addClass('hide-article-comments');
          }

        },
      }
    );
  });
</script>
