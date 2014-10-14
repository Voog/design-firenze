<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% assign blog_page = true %}
  {% include "html-head" %}
  {% include 'edicy-tools-variables' with 'article' %}
</head>

<body class="post-page content-page js-bgpicker-body-image"{{ body_image_style }}>
  {% if editmode %}<button class="bgpicker-btn js-bgpicker-body-settings" data-bg-image="{{ body_image }}" data-bg-color="{{ body_color }}"></button>{% endif %}
  {% if body_color != '' or editmode %}<div class="background-color js-bgpicker-body-color"{{ body_color_style }}></div>{% endif %}

  {% include "topbar" with "article" %}
  <div class="container">
    <div class="wrap js-wrap">
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

  {% include "javascripts" %}
  {% include "edicy-tools" with 'article' %}
  <script>site.initPostPage();</script>
</body>
</html>
