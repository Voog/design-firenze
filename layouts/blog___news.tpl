<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head>
  {% include "html-head" %}
  <meta property="og:url" content="{{ site.url }}">
  <meta property="og:title" content="{{ site.name }}">
  {% unless page.description == nil or page.description == "" %}<meta property="og:description" content="{{ page.description }}">{% endunless %}
  {% comment %}<!-- TODO: Add functionality after the CMS is going to support it -->{% endcomment %}
  {% if page.data.fb_image %}<meta property="og:image" content="{{ site.url }}{{ photos_path }}/{{ page.data.fb_image }}">{% comment %}<!-- TODO: Add functionality -->{% endcomment %}{% endif %}

  <!-- Sets the body background image value for article pages -->
  {% if article.data.body_image == nil %}
    {% assign body_image = '/images/blog-page-bg.jpg' %}
  {% else %}
    {% assign body_image = article.data.body_image %}
  {% endif %}
  {% include "bg-picker-variables" %}

  {{ blog.rss_link }}
  {{ site.stats_header }}
</head>

<body class="blog-page content-page js-bgpicker-body-image">
  {% if editmode %}<button class="bgpicker-btn js-bgpicker-body-settings" data-bg-image="{{ body_image }}" data-bg-color="{{ body_color }}"></button>{% endif %}
  {% if body_color != '' or editmode %}<div class="background-color js-bgpicker-body-color"{{ body_color_style }}></div>{% endif %}

  <div class="container">
    <div class="container-middle js-container-middle">
      <div class="container-inner">
        <div class="wrap">
          <div class="wrap-inner">
            {% include "topbar" %}
            {% include "header" %}
            {% include "tags-blog" %}

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
        </div>
      </div>
    </div>

    {% include "footer" %}
  </div>

  {% include "javascripts" %}
  {% include "bg-picker" %}
  <script>
    $(document).ready(function() {
      currentUrl = window.location.href;
      blogUrl = "{{ site.url }}{{ page.path }}";
      if (currentUrl === blogUrl) {
        $(".js-tags-all").addClass("active");
      };
    });

    {% unless body_image == nil or body_image == '' %}
      $.backstretch('{{ body_image }}');
    {% endunless %}

    site.initBlogPage();
  </script>
</body>
</html>

