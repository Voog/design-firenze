{% comment %}FACEBOOK OPEN GRAPH META TAGS{% endcomment%}
{% comment %}https://developers.facebook.com/tools/debug - Debug after each modification{% endcomment %}
{% if site.data.fb_admin %}<meta property="fb:admins" content="{{ site.data.fb_admin }}">{% endif %}
<meta property="og:type" content="{% if article %}article{% else %}website{% endif %}">
<meta property="og:url" content="{{ site.url }}{% if article %}{{ article.url | remove_first:'/' }}{% else %}{{ page.url | remove_first:'/' }}{% endif %}">
<meta property="og:title" content="{{ page_title | escape }}">
<meta property="og:site_name" content="{{ page.site_title | escape }}">

{% comment %}Open Graph image{% endcomment %}
{% if front_page or blog_page %}
  {% if fallback_body_image == nil and body_bg.image == nil %}
    <meta property="og:image" content="{% if images_path contains "http://" or images_path contains "https://" %}{% else %}{{ site.url }}{% endif %}{{ body_bg_image_original | remove_first: '/' }}">
  {% elsif fallback_body_image != nil and body_bg.image == nil %}
    <meta property="og:image" content="{{ body_bg_image }}">
  {% else %}
    {% for image_size in body_bg_image_sizes %}
      {% if forloop.first %}
        <meta property="og:image" content="{{ image_size.url }}">
      {% endif %}
    {% endfor %}
  {% endif %}
{% else %}
  {% if article and article.data.fb_image %}
    <meta property="og:image" content="{{ article.data.fb_image }}">
  {% elsif page.data.fb_image %}
    <meta property="og:image" content="{{ page.data.fb_image }}">
  {% elsif site.data.fb_image %}
    <meta property="og:image" content="{{ site.data.fb_image }}">
  {% endif %}
{% endif %}

{% comment %}Open Graph description{% endcomment %}
{% if blog_page and (page.description == nil or page.description == "") %}
  {% assign excerpt_description = articles.first.excerpt | strip_html | escape | strip_newlines | truncatewords: 200, '...' %}
  <meta property="og:description" content="{{ excerpt_description }}">
  <meta name="description" content="{{ excerpt_description }}">
{% else %}
  {% if article %}{% assign description = article.description %}{% else %}{% assign description = page.description %}{% endif %}
  {% if description != nil and description != "" %}
    <meta property="og:description" content="{{ description }}">
    <meta name="description" content="{{ description }}">
  {% endif %}
{% endif %}
