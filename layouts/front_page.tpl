<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% assign front_page = true %}
  {% include "html-head" %}
  {% include "edicy-tools-variables" %}
</head>

<body class="front-page js-body js-bgpicker-body-image"{{ body_image_style }}>

  {% if editmode %}<button class="bgpicker-btn js-bgpicker-body-settings" data-bg-image="{{ body_image }}" data-bg-color="{{ body_color }}"></button>{% endif %}
  {% if body_color != '' or editmode %}<div class="background-color js-bgpicker-body-color"{{ body_color_style }}></div>{% endif %}

  <div class="container js-container">
    <div class="container-middle js-container-middle">
      <div class="container-inner js-container-inner">
        {% include 'header-options' %}

        <div class="wrap js-wrap">
          <div class="wrap-inner">
            {% include "header" %}
          </div>
        </div>
      </div>
    </div>

    {% include "footer" %}
  </div>

  {% include "javascripts" %}
  {% include "edicy-tools" %}
  <script>site.initFrontPage();</script>
</body>
</html>
