{% comment %}TEMPLATE META DATA{% endcomment %}
{% comment %}https://developers.facebook.com/tools/debug - Debug after each modification{% endcomment %}
{% if site.data.fb_admin %}<meta property="fb:admins" content="{{ site.data.fb_admin }}">{% endif %}
<meta property="og:type" content="{% if article %}article{% else %}website{% endif %}">
<meta property="og:url" content="{{ site.url }}{% if article %}{{ article.url | remove_first:'/' }}{% else %}{{ page.url | remove_first:'/' }}{% endif %}">
<meta property="og:title" content="{{ page_title | escape }}">
<meta property="og:site_name" content="{{ page.site_title | escape }}">

{% comment %}Open Graph image{% endcomment %}
{% assign use_background_image = false %}
{% if front_page or blog_page %}
  {% if page.image == nil %}
    {% assign use_background_image = true %}
  {% endif %}
{% endif %}

{% if use_background_image %}
  {% if fallback_body_image != nil and fallback_body_image != '' and body_bg_image_sizes == nil %}
    {% assign og_image = fallback_body_image %}
  {% elsif body_bg_image_sizes != nil and body_bg_image_sizes != '' %}
    {% for size in body_bg_image_sizes reversed %}
      {% if size.width <= 1280 %}
        {% assign og_image = size %}
      {% else %}
        {% break %}
      {% endif %}
    {% endfor %}
  {% endif %}
{% else %}
  {% if article %}
    {% if article.image? %}
      {% assign og_image = article.image.for-width-1200 %}
    {% endif %}
  {% elsif page.image? %}
    {% assign og_image = page.image.for-width-1200 %}
  {% endif %}
{% endif %}

{% if og_image %}
  {% if og_image.url %}
    {% comment %}"http:" and "https:" strings are removed and readded to ensure that older bg-picker images will have protocol.{% endcomment %}
    {% if og_image.url %}<meta property="og:image" content="{{ og_image.url | replace_first: "http:", "" | replace_first: "https:", "" | prepend: "https:" }}">{% endif %}
  {% elsif og_image %}
    <meta property="og:image" content="{{ og_image }}">
  {% endif %}
  {% if og_image.content_type %}<meta property="og:image:type" content="{{ og_image.content_type }}">{% endif %}
  {% if og_image.width and og_image.width > 0 %}<meta property="og:image:width" content="{{ og_image.width }}">{% endif %}
  {% if og_image.height and og_image.width > 0 %}<meta property="og:image:height" content="{{ og_image.height }}">{% endif %}
{% endif %}

{% comment %}Open Graph description{% endcomment %}
{% if article %}
  {% assign description = article.description %}
{% else %}
  {% assign description = page.description %}
{% endif %}

{% if description != nil and description != '' %}
  <meta property="og:description" content="{{ description | escape }}">
  <meta name="description" content="{{ description | escape }}">
{% endif %}
