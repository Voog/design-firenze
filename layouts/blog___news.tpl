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

  <div class="container js-container">
    <div class="container-inner">
      <div class="wrap">
        {% include "topbar" %}

        <div class="wrap-inner">
          {% include "header" %}

          <main class="content" role="main">
            {% addbutton %}
            {% for article in articles %}
              <article class="post">
                <header class="post-header">
                  <h2 class="post-title"><a href="{{ article.url }}">{{ article.title }}</a></h2>
                  <time class="post-date" datetime="{{ article.created_at | date : '%Y-%m-%d' }}">{{ article.created_at | format_date: 'long' }}</time>
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
  {% include "bg-picker" %}

  <script>
    site.initBlogPage();

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

