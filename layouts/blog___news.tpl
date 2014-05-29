<!DOCTYPE html>
<!-- Sets the body background image value -->
{% capture dont_render %}
  {% if page.data.body_image == nil %}
    {% assign body_image = '/images/blog-page-bg.jpg' %}
  {% else %}
    {% assign body_image = page.data.body_image %}
  {% endif %}
{% endcapture %}
{% include "bg-picker-variables" %}
<html class="blog-page js-bgpicker-body-image{% if editmode %}editmode{% else %}public{% endif %}"{{ body_image_style}} lang="{{ page.language_code }}">
<head>
  {% include "html-head" %}
  <meta property="og:url" content="{{ site.url }}">
  <meta property="og:title" content="{{ site.name }}">
  {% unless page.description == nil or page.description == "" %}<meta property="og:description" content="{{ page.description }}">{% endunless %}
  {% comment %}<!-- TODO: Add functionality after the CMS is going to support it -->{% endcomment %}
  {% if page.data.fb_image %}<meta property="og:image" content="{{ site.url }}{{ photos_path }}/{{ page.data.fb_image }}">{% comment %}<!-- TODO: Add functionality -->{% endcomment %}{% endif %}

  {{ blog.rss_link }}

  {{ site.stats_header }}
</head>

<body class="content-page"{{ body_image_style }}>
  {% if editmode %}<button class="bgpicker-btn js-bgpicker-body-settings" data-bg-image="{{ body_image }}" data-bg-color="{{ body_color }}"></button>{% endif %}
  <div class="background-color js-bgpicker-body-color"{{ body_color_style }}></div>

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
      blogUrl = "{{ site.url }}{{ page.path }}";
      if (currentUrl === blogUrl) {
        $(".js-tags-all").addClass("active");
      };
    });
  </script>
</body>
</html>

