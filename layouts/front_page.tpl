<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head>
  {% include "html-head" %}
  <meta property="og:url" content="{{ site.url }}">
  <meta property="og:title" content="{{ site.name }}">
  <meta property="og:description" content="{{ page.description }}">
  <meta property="og:image" content="{{ site.url }}{{ photos_path }}/{{ page.data.fb_image }}"><!-- TODO: Add image location data tag -->

  <!-- Sets the body background image value -->
  {% if page.data.body_image == nil %}
    {% assign body_image = '/images/front-page-bg.jpg' %}
  {% endif %}
  {% include "bg-picker-variables" %}
</head>

<body class="front-page js-bgpicker-body-image"{{ body_image_style }}>
  {% if editmode %}<button class="bgpicker-btn js-bgpicker-body-settings" data-bg-image="{{ body_image }}" data-bg-color="{{ body_color }}"></button>{% endif %}
  <div class="background-color js-bgpicker-body-color"{{ body_color_style }}></div>

  <div class="container">
    <div class="container-inner">
      <div class="wrap">

        <div class="wrap-inner">
          {% include "header" %}
        </div>
      </div>
    </div>
    {% include "footer" %}
  </div>

  {% include "javascripts" %}
  {% include "bg-picker" %}
</body>
</html>
