<!DOCTYPE html>
{% include "template-variables" %}
{% include "blog-article-variables" %}
{% include "blog-settings-variables" %}
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% assign blog_page = true %}
  {% include "edicy-tools-variables" %}
  {% include "content-page-variables" %}
  {% include "html-head" blog_list: true %}
  {% include "edicy-tools-styles" %}
</head>

<body class="post-page content-page{% unless editmode or site_header_has_content %} empty-site-header{% endunless %} js-bg-picker-area{% if fallback_state %} bgpicker-fallback{% endif %} blog-page">
{% if editmode %}<button class="bgpicker-btn js-background-settings" data-bg-key="body_bg" data-bg-default-image-color="rgb(111, 108, 119)" data-bg-image="{{ body_bg_image }}" data-bg-image-sizes="{{ body_bg_image_sizes_str | escape }}" data-bg-color="{{ body_bg_color }}" data-bg-color-data="{{ body_bg_color_data_str | escape }}"></button>{% endif %}
{% if body_bg_image != '' or editmode %}<div class="body-background-image js-background-image"></div>{% endif %}
{% if body_bg_color != '' or editmode %}<div class="body-background-color js-background-color"></div>{% endif %}

  {% include "topbar" %}

  <div class="container js-container">
    <div class="container-inner">
      <div class="wrap js-wrap">
        {% include "header" %}
        {% include "tags-blog" %}

        <main class="content" role="main">
          <section class="content-formatted post-intro-content" data-search-indexing-allowed="true" {{ edy_intro_edit_text }}>{% content %}</section>
          
          <div class="btn-container">
            {% addbutton %}
            {% include "blog-settings-editor" %}
          </div>

          {% for article in articles %}
            <article class="post">
              <header class="post-header">
                <h1 class="post-title"><a href="{{ article.url }}">{{ article.title }}</a></h1>
                {% assign article_year = article.created_at | format_date: "%Y" | to_num %}

                {% if article_year == current_year %}
                  {% assign article_date_format = "long_without_year" %}
                {% else %}
                  {% assign article_date_format = "long" %}
                {% endif %}

                <time class="post-date {{ toggle_article_date }}" datetime="{{ article.created_at | date: '%Y-%m-%d' }}">{{ article.created_at | format_date: article_date_format }}</time>
              </header>

              <section class="post-content"><div class="post-excerpt content-formatted">{{ article.excerpt }}</div></section>
              <a class="post-read-more-btn" href="{{ article.url }}">{{ "read_more" | lc }}</a>
            </article>
          {% endfor %}
        </main>
      </div>
    </div>

    {% include "footer" %}
  </div>

  {% include "site-signout" %}
  {% include "javascripts" %}
  {% include "edicy-tools" %}
  <script>site.initBlogPage();</script>
</body>
</html>
