{% comment %}IE SETTINGS{% endcomment %}
<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->

{% comment %}BASIC META INFO{% endcomment %}
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
<meta name="format-detection" content="telephone=no">

{% comment %}FAV ICON{% endcomment %}
{% if site.has_favicon? %}
  <link rel="icon" href="/favicon.ico" type="image/x-icon">
  <link rel="shortcut icon" href="/favicon.ico" type="image/ico">
  <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
{% endif %}
{% comment %}TODO: Add functionality after the CMS is going to support it{% endcomment %}
{% if site.data.touch_icon %}<link rel="apple-touch-icon" href="{{ site.data.touch_icon }}">{% endif %}

{% comment %}STYLESHEETS{% endcomment %}
{% stylesheet_link "main.min.css?v=firenze-2.3.1" %}
{% if editmode %}<link rel="stylesheet" href="{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.css">{% endif %}
{% if editmode %}{% stylesheet_link "editmode.min.css?v=firenze-2.3.1" %}{% endif %}
<!--[if lt IE 9]>{% stylesheet_link "ie8.min.css?v=1" %}<![endif]-->

{% comment %}Google fonts for Design Editor{% endcomment %}
<link href="https://fonts.googleapis.com/css?family=Anonymous+Pro:400,400i,700,700i|Arvo:400,400i,700,700i|Cousine:400,400i,700,700i|Crimson+Text:400,400i,700,700i|Fira+Sans:400,400i,700,700i|Lato:400,400i,700,700i|Lora:400,400i,700,700i|Montserrat:400,400i,700,700i|Noto+Serif:400,400i,700,700i|Open+Sans:400,400i,700,700i|PT+Sans:400,400i,700,700i|PT+Serif:400,400i,700,700i|Playfair+Display:400,400i,700,700i|Raleway:400,400i,700,700i|Roboto+Mono:400,400i,700,700i|Roboto+Slab:400,700|Roboto:400,400i,700,700i|Source+Sans+Pro:400,400i,700,700i|Ubuntu+Mono:400,400i,700,700i|Ubuntu:400,400i,700,700i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,hebrew,latin-ext,vietnamese" rel="stylesheet">

{% customstyle %}

{% if front_page %}
    {% include "template-cs-main-styles-front" %}
    {% include "template-cs-header-front" %}
    {% include "template-cs-content-front" %}
    {% include "template-cs-headings-front" %}
    {% include "template-cs-button-front" %}
    {% include "template-cs-table-front" %}
  {% else %}
    {% include "template-cs-main-styles" %}
    {% include "template-cs-header" %}

    {% if common_page %}
      {% include "template-cs-content" %}
    {% elsif blog_list %}
      {% include "template-cs-blog-list" %}
    {% elsif blog_article %}
      {% include "template-cs-blog-article" %}
    {% elsif items_page %}
      {% include "template-cs-product" %}
    {% endif %}

    {% include "template-cs-headings" %}
    {% include "template-cs-button" %}
    {% include "template-cs-table" %}
    {% include "template-cs-form" %}
  {% endif %}

  {% include "template-cs-style-rules" %}

{% endcustomstyle %}

{% comment %}MODERNIZR - HTML5 SUPPORT FOR OLDER BROWSERS, SVG SUPPORT DETECTION ETC{% endcomment %}
<script src="{{ javascripts_path }}/modernizr-custom.min.js?v=firenze-2.3.1"></script>

{% comment %}SITE TITLE{% endcomment %}
<title>{% title %}</title>

{% include "template-meta" %}

{% comment %}BREADCRUMBS{% endcomment %}
{%- capture breadcrumbsScript -%}
  {%- sd_breadcrumbs -%}
{%- endcapture -%}
{{ breadcrumbsScript }}

{% if blog %}{{ blog.rss_link }}{% endif %}
{{ site.stats_header }}
