<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head>
  {% include "html-head" %}
  <meta property="og:url" content="{{ site.url }}">
  <meta property="og:title" content="{{ site.name }}">
  <meta property="og:description" content="{{ page.description }}">
  <meta property="og:image" content="{{ site.url }}{{ photos_path }}/{{ page.data.fb_image }}"><!-- TODO: Add image location data tag -->
  {{ blog.rss_link }}
</head>

<body class="blog-page js-bgpicker-body-image" {% if page.data.body_image %}style="background-image: url('{{ page.data.body_image}}');"{% endif %}>
  {% if editmode %}<button class="bgpicker-btn js-bgpicker-body-settings" data-bg-image="{{ page.data.body_image }}" data-bg-color="{{ page.data.body_color }}"></button>{% endif %}
  <div class="background-color js-bgpicker-body-color"{% if page.data.body_color %} style="background-color: {{ page.data.body_color }};{% if page.data.body_image %} opacity: 0.5;{% endif %}"{% endif %}></div>

  <div class="container">
    <div class="container-inner">
      <div class="wrap">
        <div class="wrap-inner">
          {% include "header" %}

          <main class="content" role="main">
            <article class="post">
              <header class="post-header">
                <h2 class="post-title"><a href="{{ article.url }}">{% editable article.title %}</a></h2>
                <time class="post-date" datetime="{{ article.created_at | date : '%Y-%m-%d' }}">{{ article.created_at | format_date: 'long' }}</time>
                <div class="post-comments-count">
                  <a href="#comments">{% case article.comments_count %}{% when 0 %}{{ "no_comments" | lc }}{% else %}{{ "comments_for_count" | lc}}: <span class="edy-site-blog-comments-count">{{article.comments_count}}</span>{% endcase %}</a></div>
              </header>

              <div class="post-content">
                <div class="post-excerpt content-formatted">{% editable article.excerpt %}</div>
                <div class="post-body content-formatted">{% editable article.body %}</div>
              </div>
            </article>

            {% include "tags-post" %}
          </main>

          <section id="comments" class="comments content-formatted">
            {% case article.comments_count %}{% when 0 %}{% else %}<h1 class="comments-title"><span class="edy-site-blog-comments-count">{{article.comments_count}}</span> {{ "comments_for_count" | lc }}</h1>{% endcase %}

            <div class="comment-messages">
              {% for comment in article.comments reversed %}
                <div class="comment edy-site-blog-comment">
                  <span class="comment-body">{{ comment.body_html }}</span>
                  <span class="comment-info">
                    <span class="comment-author">{{ comment.author }}, </span><span>{{ comment.created_at | format_date: "long" }}</span>
                  </span>
                  {% removebutton %}
                  </div>
              {% endfor %}
            </div>

            {% include "comment-form" %}
          </section>
        </div>

        {% include "footer" %}
      </div>
    </div>
  </div>

  {% include "javascripts" %}
  {% include "bg-picker" %}

  <script>
    site.initBlogPage();

    $.backstretch("{{ photos_path }}/blog-page-bg.jpg");

    $(document).ready(function() {
      currentUrl = window.location.href;
      blogUrl = "{{ site.url }}/{{ page.path }}";
      if (currentUrl === blogUrl) {
        $(".blog-main").addClass("active");
      };
    });
  </script>
</body>
</html>

