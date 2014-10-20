<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% assign common_page = true %}
  {% include "html-head" %}
  {% include "edicy-tools-variables" %}
</head>

<body class="common-page content-page js-bgpicker-body-image"{{ body_image_style }}>
  {% if editmode %}<button class="bgpicker-btn js-bgpicker-body-settings" data-bg-image="{{ body_image }}" data-bg-color="{{ body_color }}"></button>{% endif %}
  {% if body_color != '' or editmode %}<div class="background-color js-bgpicker-body-color"{{ body_color_style }}></div>{% endif %}

  {% include "topbar" %}

  <div class="container js-container">
    <div class="container-inner">
      <div class="wrap js-wrap">
        {% include "header" %}
        {% include 'header-options' %}
        {% include "menu-level-2" %}

        <main class="content" role="main">
          <section class="content-formatted">{% content %}</section>
        </main>
      </div>
    </div>

    {% include "footer" %}
  </div>


  {% include "javascripts" %}
  {% include "edicy-tools" %}
  <script>site.initCommonPage();</script>
</body>
</html>
