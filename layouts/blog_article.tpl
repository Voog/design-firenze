<!DOCTYPE html>
{% include "template-variables" %}
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% assign post_page = true %}
  {% include "edicy-tools-variables" with "article" %}
  {% include "html-head" blog_article: true %}
  {% include "edicy-tools-styles" %}
</head>

<body class="post-page content-page{% unless editmode or site_header_has_content %} empty-site-header{% endunless %} js-bg-picker-area{% if fallback_state %} bgpicker-fallback{% endif %}">
  {% if editmode %}<button class="bgpicker-btn js-background-settings" data-bg-key="body_bg" data-bg-image="{{ body_bg_image }}" data-bg-image-sizes="{{ body_bg_image_sizes_str | escape }}" data-bg-color="{{ body_bg_color }}" data-bg-color-data="{{ body_bg_color_data_str | escape }}"></button>{% endif %}
  {% if body_bg_image != '' or editmode %}<div class="body-background-image js-background-image"></div>{% endif %}
  {% if body_bg_color != '' or editmode %}<div class="body-background-color js-background-color"></div>{% endif %}

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
              <time class="post-date" datetime="{{ article.created_at | date : '%Y-%m-%d' }}">{{ article.created_at | format_date: 'long' }}</time>
              {% if article.comments_count > 0 %}
                <div class="post-comments-count">
                  <a href="#comments">{{ 'post_has_replies' | lcc : article.comments_count }}</a>
                </div>
              {% endif %}
            </header>

            <div class="post-content">
              <div class="post-excerpt content-formatted">{% editable article.excerpt %}</div>
              <div class="post-body content-formatted">{% editable article.body %}</div>
            </div>
          </article>
        </main>

        <section id="comments" class="comments content-formatted">
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
      </div>
    </div>

    {% include "footer" %}
  </div>

  {% include "javascripts" %}
  {% include "edicy-tools" with 'article' %}
  <script>site.initPostPage();</script>
</body>
</html>
