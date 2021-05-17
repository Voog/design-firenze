<!DOCTYPE html>
{% include "template-variables" %}
{% include "blog-article-variables" %}
{% include "article-settings-variables" %}
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% assign post_page = true %}
  {% include "edicy-tools-variables" with "article" %}
  {% include "html-head" blog_article: true %}
  {% include "edicy-tools-styles" %}
</head>

<body class="post-page content-page{% unless editmode or site_header_has_content %} empty-site-header{% endunless %} js-bg-picker-area{% if fallback_state %} bgpicker-fallback{% endif %}">
  {% if editmode %}<button class="bgpicker-btn js-background-settings" data-bg-key="body_bg" data-bg-default-image-color="rgb(111, 108, 119)" data-bg-image="{{ body_bg_image }}" data-bg-image-sizes="{{ body_bg_image_sizes_str | escape }}" data-bg-color="{{ body_bg_color }}" data-bg-color-data="{{ body_bg_color_data_str | escape }}"></button>{% endif %}
  {% if body_bg_image != '' or editmode %}<div class="body-background-image js-background-image"></div>{% endif %}
  {% if body_bg_color != '' or editmode %}<div class="body-background-color js-background-color"></div>{% endif %}
  {%- assign articleSettingsData = article.data.article_settings -%}

  {% include "topbar" with "article" %}

  <div class="container js-container">
    <div class="container-inner">
      <div class="wrap js-wrap">
        {% include "header" %}
        {% include "tags-post" %}

        <main class="content" role="main">
          <article class="post">
            <header class="post-header">
              <h1 class="post-title">{% editable article.title %}</h1>

              {% assign article_year = article.created_at | format_date: "%Y" | to_num %}

              {% if article_year == current_year %}
                {% assign article_date_format = "long_without_year" %}
              {% else %}
                {% assign article_date_format = "long" %}
              {% endif %}

              {% if editmode or show_article_date != false %}
                <time class="post-date{% if show_article_date == false %} hide-article-date{% endif %}" datetime="{{ article.created_at | date: '%Y-%m-%d' }}">{{ article.created_at | format_date: article_date_format }}</time>
              {% endif %}

              {% if article.comments_count > 0 %}
                <div class="post-comments-count">
                  <a href="#comments">{{ 'post_has_replies' | lcc : article.comments_count }}</a>
                </div>
              {% endif %}
            </header>

            <div class="post-content">
              <div class="post-excerpt content-formatted" {{ edy_intro_edit_text }}>{% editable article.excerpt %}</div>
              <div class="post-body content-formatted">{% editable article.body %}</div>
              <div class="post-body content-formatted">{% content name="additional_body" bind="Article" %}</div>
            </div>
          </article>
        </main>

        {% if article.older or article.newer %}
          <div class="post-nav">
            <div class="post-nav-inner">
              {% if article.older %}
                <a class="post-nav-link post-nav-link-older" href="{{ article.older.url }}">
                  <div class="post-nav-link-inner">
                    <div class="post-nav-direction">{{ "previous" | lc }}</div>
                    <div class="post-nav-title">{{ article.older.title }}</div>
                  </div>
                </a>
              {% endif %}

              {% if article.newer %}
                <a class="post-nav-link post-nav-link-newer" href="{{ article.newer.url }}">
                  <div class="post-nav-link-inner">
                    <div class="post-nav-direction">{{ "next" | lc }}</div>
                    <div class="post-nav-title">{{ article.newer.title }}</div>
                  </div>
                </a>
              {% endif %}
            </div>
          </div>
        {% endif %}

        {% if editmode or show_article_comments != false %}
          <section id="comments" class="comments content-formatted{% if show_article_comments == false %} hide-article-comments{% endif %}">
            {% if article.comments_count > 0 %}
            <h2 class="comments-title">{{ 'replies' | lcc : article.comments_count }}</h2>

            <div class="comment-messages">
              {% for comment in article.comments reversed %}
              <div class="comment edy-site-blog-comment">
                <span class="comment-body">{{ comment.body_html }}</span>
                <span class="comment-info">
                  <span class="comment-author">{{ comment.author }}, </span>
                  <span class="comment-date">{{ comment.created_at | format_date: "long" }}</span>
                </span>
                {% removebutton %}
              </div>
              {% endfor %}
            </div>
            {% endif %}
            {% include "comment-form" %}
          </section>
        {% endif %}
        
      </div>
    </div>

    {% include "footer" %}
  </div>

  {% include "site-signout" %}
  {% include "javascripts" %}
  {% include "edicy-tools" with "article" %}
  {% include "settings-editor" %}
  {% include "settings-popover", _articlePage: true %}
  <script>site.initPostPage();</script>
</body>
</html>
