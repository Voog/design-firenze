<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head>
  {% include "html-head" %}
  <meta property="og:url" content="{{ site.url }}">
  <meta property="og:title" content="{{ site.name }}">
  <meta property="og:description" content="{{ article.excerpt | strip_html | truncate: 120 }}">
  {% comment %}<!-- TODO: Add functionality after the CMS is going to support it -->{% endcomment %}
  {% if page.data.fb_image %}<meta property="og:image" content="{{ site.url }}{{ photos_path }}/{{ page.data.fb_image }}">{% endif %}

  <!-- Sets the body background image value for article pages -->
  {% if article.data.body_image == nil %}
    {% assign body_image = '/images/blog-page-bg.jpg' %}
  {% else %}
    {% assign body_image = article.data.body_image %}
  {% endif %}
  {% include 'bg-picker-variables' with 'article' %}

  {{ site.stats_header }}
</head>

<body class="post-page content-page js-bgpicker-body-image">
  {% if editmode %}<button class="bgpicker-btn js-bgpicker-body-settings" data-bg-image="{{ body_image }}" data-bg-color="{{ body_color }}"></button>{% endif %}
  {% if body_color != '' or editmode %}<div class="background-color js-bgpicker-body-color"{{ body_color_style }}></div>{% endif %}

  <div class="container">
    <div class="container-middle js-container-middle">
      <div class="container-inner">
        <div class="wrap js-wrap">
          <div class="wrap-inner">
            {% include "topbar" with "article" %}
            {% include "header" %}
            {% include "tags-post" %}

            <main class="content" role="main">
              <article class="post">
                <header class="post-header">
                  <h2 class="post-title">{% editable article.title %}</h2>
                  <time class="post-date" datetime="{{ article.created_at | date : '%Y-%m-%d' }}">{{ article.created_at | format_date: 'long' }}</time>
                  <div class="post-comments-count">
                    <a href="#comments">{% case article.comments_count %}{% when 0 %}{{ "no_comments" | lc }}{% else %}{{ "comments_for_count" | lc}}: <span class="edy-site-blog-comments-count">{{ article.comments_count }}</span>{% endcase %}</a>
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
                <h2 class="comments-title"><span class="edy-site-blog-comments-count">{{ article.comments_count }}</span> {{ "comments_for_count" | lc }}</h2>

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
      </div>
    </div>

    {% include "footer" %}
  </div>

  {% include "javascripts" %}
  {% include "bg-picker" with 'article' %}

  <script>
    {% unless body_image == nil or body_image == '' %}
      $.backstretch('{{ body_image }}');
    {% endunless %}

    site.initPostPage();
  </script>
</body>
</html>

