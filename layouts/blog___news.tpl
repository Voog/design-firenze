<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% assign blog_page = true %}
  {% include "edicy-tools-variables" %}
  {% include "html-head" %}
  {% include "edicy-tools-styles" %}
</head>

<body class="blog-page content-page body-background-image js-body js-body-background-image{% if fallback_state %} bgpicker-fallback{% endif %}">
  {% if editmode %}<button class="bgpicker-btn js-body-background-settings" data-bg-image="{{ body_bg_image }}" data-bg-image-sizes="{{ body_bg_image_sizes_str | escape }}" data-bg-color="{{ body_bg_color }}" data-bg-color-data="{{ body_bg_color_data_str | escape }}"></button>{% endif %}
  {% if body_bg_color != '' or editmode %}<div class="body-background-color js-body-background-color"></div>{% endif %}

  {% include "topbar" %}

  <div class="container js-container">
    <div class="container-inner">
      <div class="wrap js-wrap">
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

    {% include "footer" %}
  </div>

  {% include "javascripts" %}
  {% include "edicy-tools" %}
  <script>site.initBlogPage();</script>
</body>
</html>
