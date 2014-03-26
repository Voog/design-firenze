<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
  <head>
    {% include "html-head" %}
    <meta property="og:url" content="{{ site.url }}">
    <meta property="og:title" content="{{ site.name }}">
    <meta property="og:description" content="{{ page.description }}">
    <meta property="og:image" content="{{ site.url }}{{ photos_path }}/{{ page.data.fbimage }}"><!-- TODO: Add image location data tag -->
    {{ blog.rss_link }}
  </head>

  <body class="post-page">
    <div class="container js-container">
      {% include "topbar" %}

      <div class="wrap">
        <div class="wrap-middle">
          <div class="wrap-inner">
            {% include "header" %}

            <main class="content" role="main">
              <article class="post">
                <header class="post-header content-formatted">
                  <h1 class="post-title">{% editable article.title %}</h1>
                  <time class="post-date" datetime="{{ article.created_at | date : "%Y-%m-%d" }}">{{ article.created_at | date : "%b %d, %Y" }}</time>
                  <div class="post-comments-count"><a href="#comments">{% case article.comments_count %}{% when 0 %}{{"no_comments"|lc}}{% else %}{{"comments_for_count" | lc}}: <span class="edy-site-blog-comments-count">{{article.comments_count}}</span>{% endcase %}</a></div>
                </header>

                <section class="post-content">
                  <div class="post-excerpt content-formatted">{% editable article.excerpt %}</div>
                  <div class="post-body content-formatted">{% editable article.body %}</div>
                </section>

                {% include "tags-article" %}

              </article>
            </main>

            <section id="comments" class="comments">
              <div class="comments-inner">
                {% case article.comments_count %}{% when 0 %}{% else %}<h2 class="comment-title">{{"comments_for_count" | lc}}: <span class="edy-site-blog-comments-count">{{article.comments_count}}</span></h2>{% endcase %}

                <div class="comments-container">
                  {% for comment in article.comments reversed %}
                    <div class="comment">{{ comment.body }} ({{ comment.author }}, {{ comment.created_at | date : "%b %d, %Y" }})</div>
                  {% endfor %}
                </div>

                {% include "comment-form" %}
              </div>
            </section>

          </div>
          {% include "footer" %}
        </div>
      </div>
    </div>

    {% include "javascripts" %}
    <script>
      site.initArticlePage();

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
