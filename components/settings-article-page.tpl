{% include 'settings-editor-button',
  _titleKey: "article",
  _descriptionKey: "edit_article_settings",
  _className: "js-article-settings-btn",
  _wrapClassName: "content_settings-btn"
%}

<script>
  window.addEventListener('DOMContentLoaded', function(event) {
    {% if articleSettingsData %}
      var articleDataValues = {{ articleSettingsData | json }};
    {% else %}
      var articleDataValues = {};
    {% endif %}

    {% if site.data.article_settings %}
      var globalDataValues = {{ site.data.article_settings | json }};
    {% else %}
      var globalDataValues = {};
    {% endif %}

    var show_comments, show_date;

    if (articleDataValues.show_comments != null && articleDataValues.show_comments !== '') {
      show_comments = Boolean(articleDataValues.show_comments)
    } else if (globalDataValues.show_comments != null && globalDataValues.show_comments !== '') {
      show_comments = Boolean(globalDataValues.show_comments)
    } else {
      show_comments = true;
    }

    if (articleDataValues.show_date != null && articleDataValues.show_date !== '') {
      show_date = Boolean(articleDataValues.show_date)
    } else if (globalDataValues.show_dates != null && globalDataValues.show_dates !== '') {
      show_date = Boolean(globalDataValues.show_dates)
    } else {
      show_date = true;
    }
    
    var valuesObj = {
      show_comments: show_comments,
      show_date: show_date
    }
    initSettingsEditor(
      {
        settingsBtn: document.querySelector('.js-article-settings-btn'),
        menuItems: [
          {
            "titleI18n": "comments",
            "type": "toggle",
            "key": "show_comments",
            "tooltipI18n": "toggle_current_article_comments",
            "states": {
              "on": true,
              "off": false
            }
          },
          {
            "titleI18n": "publishing_date",
            "type": "toggle",
            "key": "show_date",
            "tooltipI18n": "toggle_current_article_date",
            "states": {
              "on": true,
              "off": false
            }
          }
        ],
        dataKey: 'article_settings',
        values: valuesObj,
        entityData: 'articleData',
        containerClass: ['bottom-settings-popover', 'first', 'editor_default'],
        noReload: true,

        prevFunc: function(data) {
          var $articleComment = $('.comments'),
            $articleDate = $('.post-date.site-data');
          if (data.show_date == true) {
            $articleDate.removeClass('hide-article-date');
            $articleDate.addClass('show-article-date');
          } else if (data.show_date == false) {
            $articleDate.removeClass('show-article-date');
            $articleDate.addClass('hide-article-date');
          }
          
          if (data.show_comments == true) {
            $articleComment.removeClass('hide-article-comments');
            $articleComment.addClass('show-article-comments');
          } else if (data.show_comments == false) {
            $articleComment.removeClass('show-article-comments');
            $articleComment.addClass('hide-article-comments');
          }
        }
      }
    );
  });
</script>
