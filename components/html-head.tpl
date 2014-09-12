{% comment %}<!-- IE SETTINGS -->{% endcomment %}
<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->

{% comment %}<!-- BASIC META INFO -->{% endcomment %}
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">
{% unless page.keywords == nil or page.keywords == "" %}<meta name="keywords" content="{{ page.keywords }}">{% endunless %}
{% unless page.description == nil or page.keywords == "" %}<meta name="description" content="{{ page.description }}">{% endunless %}

{% comment %}<!-- FAV ICON -->{% endcomment %}
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="/favicon.ico" type="image/ico">
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
{% comment %}<!-- TODO: Add functionality after the CMS is going to support it -->{% endcomment %}
{% if site.data.touch_icon %}<link rel="apple-touch-icon" href="{{ site.data.touch_icon }}">{% endif %}

{% comment %}<!-- MODERNIZR - HTML5 SUPPORT FOR OLDER BROWSERS, SVG SUPPORT DETECTION ETC -->{% endcomment %}
<script src="{{ javascripts_path }}/modernizr.min.js"></script>

{% comment %}<!-- STYLESHEETS -->{% endcomment %}
{% stylesheet_link "main.min.css" %}
<!--[if lt IE 9]>{% stylesheet_link "ie8.min.css" %}<![endif]-->
{% if editmode %}<link rel="stylesheet" href="{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.css">{% endif %}

{% comment %}<!-- SITE TITLE -->{% endcomment %}
{% capture page_title %}{% if article %}{{ article.title }} — {{ page.site_title }}{% else %}{% if site.root_item.selected? %}{{ page.site_title }}{% else %}{{ page.title }} — {{ page.site_title }}{% endif %}{% endif %}{% endcapture %}
<title>{{ page_title }}</title>

{% comment %}<!-- FACEBOOK OPENGRAPH -->{% endcomment %}
<!-- https://developers.facebook.com/tools/debug - Debug after each modification -->
{% comment %}<!-- TODO: Add admin and image editing support after the CMS is going to support it -->{% endcomment %}
{% if site.data.fb_admin %}<meta property="fb:admins" content="{{ site.data.fb_admin }}">{% endif %}
<meta property="og:type" content="{% if article %}article{% else %}website{% endif %}">
<meta property="og:url" content="{{ site.url }}{% if article %}{{ article.url | remove_first:'/' }}{% else %}{{ page.url | remove_first:'/' }}{% endif %}">
<meta property="og:title" content="{{ page_title | escape }}">
<meta property="og:site_name" content="{{ page.site_title | escape }}">

{% comment %}Facebook OG image settings.{% endcomment %}
{% if article %}
  {% comment %}Facebook OG image on for article pages.{% endcomment %}
  {% if article.data.fb_image %}
    <meta property="og:image" content="{{ article.data.fb_image }}">
  {% elsif page.data.fb_image %}
    <meta property="og:image" content="{{ page.data.fb_image }}">
  {% elsif site.data.fb_image %}
    <meta property="og:image" content="{{ site.data.fb_image }}">
  {% else %}
    {% unless body_image == '' %}
      <meta property="og:image" content="{{ body_image }}">
    {% endunless %}
  {% endif %}
  <meta property="og:description" content="{{ article.excerpt | strip_html | truncatewords: 200, '...' }}">
  <meta name="description" content="{{ article.excerpt | strip_html | truncatewords: 200, '...' }}">
{% else %}
  {% comment %}Facebook OG image dor content pages.{% endcomment %}
  {% if page.data.fb_image %}
    <meta property="og:image" content="{{ page.data.fb_image }}">
  {% elsif site.data.fb_image %}
    <meta property="og:image" content="{{ site.data.fb_image }}">
  {% else %}
    {% unless body_image == '' %}
      <meta property="og:image" content="{{ body_image }}">
    {% endunless %}
  {% endif %}

  {% unless page.description == nil or page.description == "" %}
    <meta property="og:description" content="{{ page.description }}">
    <meta name="description" content="{{ page.description }}">
  {% else %}
    {% unless blog or editmode %}
      {% capture content %}{% content %}{% endcapture %}
      <meta property="og:description" content="{{ content | strip_html | truncatewords: 200, '...' }}">
      <meta name="description" content="{{ content | strip_html | truncatewords: 200, '...'  }}">
    {% endunless %}
  {% endunless %}
{% endif %}

{% if blog %}{{ blog.rss_link }}{% endif %}
{{ site.stats_header }}
