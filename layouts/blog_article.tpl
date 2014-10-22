<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% assign blog_page = true %}
  {% include "html-head" %}
  {% include "edicy-tools-variables" with "article" %}
  {% include "edicy-tools-styles" %}
</head>

<body class="post-page content-page body-background-image js-body js-body-background-image">
  {% if editmode %}<button class="bgpicker-btn js-body-background-settings" data-bg-image="{{ body_bg_image }}" data-bg-image-sizes="{{ body_bg_image_sizes_str | escape }}" data-bg-color="{{ body_bg_color }}" data-bg-color-data="{{ body_bg_color_data_str | escape }}"></button>{% endif %}
  {% if body_bg_color != '' or editmode %}<div class="body-background-color js-body-background-color"></div>{% endif %}

  {% include "topbar" with "article" %}

  <div class="container js-container">
    <div class="container-inner">
      <div class="wrap light-background js-wrap">
        {% include "header" %}
        {% include 'header-options' %}
        {% include "tags-post" %}

        <main class="content" role="main">
          <article class="post">
            <header class="post-header">
              <h2 class="post-title">{% editable article.title %}</h2>
              <time class="post-date" datetime="{{ article.created_at | date : '%Y-%m-%d' }}">{{ article.created_at | format_date: 'long' }}</time>
              <div class="post-comments-count">
                <a href="#comments">{{ 'post_has_replies' | lcc : article.comments_count }}</a>
              </div>
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
