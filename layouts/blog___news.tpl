<!DOCTYPE html>
{%- include "template-settings" -%}
{%- include "template-variables" -%}
{%- include "blog-article-variables" -%}
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
          {%- assign content_default_title = "content" | lce -%}
          {%- assign content_default_title_tooltip = "content_tooltip_specific_page" | lce -%}
          <section class="content-formatted post-intro-content" data-search-indexing-allowed="true">{% content title=content_default_title title_tooltip=content_default_title_tooltip %}</section>

          {% if editmode %}
            <span class="add-button">{% addbutton %}</span>
          {% endif %}

          {% for article in articles %}
            {% include "article-settings-variables" %}
            <article class="post">
              <header class="post-header">
                <h1 class="post-title"><a href="{{ article.url }}">{{ article.title }}</a></h1>
                {% assign article_year = article.created_at | format_date: "%Y" | to_num %}

                {% if article_year == current_year %}
                  {% assign article_date_format = "long_without_year" %}
                {% else %}
                  {% assign article_date_format = "long" %}
                {% endif %}

                {% if editmode or show_article_date != false %}
                  <time class="post-date{% if show_article_date != true %} hide-article-date{% endif %}{% if article_data_show_date_defined != true%} site-data{% endif %}" datetime="{{ article.created_at | date: '%Y-%m-%d' }}">{{ article.created_at | format_date: article_date_format }}</time>
                {% endif %}
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
  {% include "settings-popover", _blogPage: true %}
  <script>site.initBlogPage();</script>
</body>
</html>
