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

  <body class="blog-page">
    <div class="container js-container">
      {% include "topbar" %}

      <div class="wrap">
        <div class="wrap-middle">
          <div class="wrap-inner">
            {% include "header" %}

            <main class="content" role="main">
              {% addbutton %}
              {% for article in articles %}
                <article class="post">
                  <header class="post-header content-formatted">
                    <h1 class="post-title"><a href="{{ article.url }}">{{ article.title }}</a></h1>
                    <time class="post-date" datetime="{{ article.created_at | date : "%Y-%m-%d" }}">{{ article.created_at | date : "%b %d, %Y" }}</time>
                  </header>

                  <section class="post-content">
                    <div class="post-excerpt content-formatted">{{ article.excerpt }}</div>
                  </section>
                </article>
              {% endfor %}
            </main>

          </div>
          {% include "footer" %}
        </div>
      </div>
    </div>

    {% include "javascripts" %}
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
