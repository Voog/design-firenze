<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% assign blog_page = true %}
  {% include "html-head" %}
  {% include "edicy-tools-variables" %}
</head>

<body class="blog-page content-page js-bgpicker-body-image"{{ body_image_style }}>
  {% if editmode %}<button class="bgpicker-btn js-bgpicker-body-settings" data-bg-image="{{ body_image }}" data-bg-color="{{ body_color }}"></button>{% endif %}
  {% if body_color != '' or editmode %}<div class="background-color js-bgpicker-body-color"{{ body_color_style }}></div>{% endif %}

  {% include "topbar" %}
  <div class="container">
    <div class="wrap js-wrap">
      {% include "header" %}
      {% include 'header-options' %}
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
  {% include "footer" %}

  {% include "javascripts" %}
  {% include "edicy-tools" %}
  <script>site.initBlogPage();</script>
</body>
</html>
