<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "html-head" %}

  <!-- Sets the body background image value -->
  {% capture dont_render %}
    {% if page.data.body_image == nil %}
      {% assign body_image = images_path | append: '/common-page-bg.jpg' %}
    {% else %}
      {% assign body_image = page.data.body_image %}
    {% endif %}
  {% endcapture %}
  {% include "bg-picker-variables" %}
</head>

<body class="common-page content-page">
  {% if editmode %}<button class="bgpicker-btn js-bgpicker-body-settings" data-bg-image="{{ body_image }}" data-bg-color="{{ body_color }}"></button>{% endif %}
  {% if body_color != '' or editmode %}<div class="background-color js-bgpicker-body-color"{{ body_color_style }}></div>{% endif %}

  <div class="container js-container">
    {% include "topbar" %}

    <div class="container-middle js-container-middle">
      <div class="container-inner js-container-inner">
        <div class="wrap js-wrap">
          <div class="wrap-inner">
            {% include "header" %}
            {% include 'header-options' %}
            {% include "menu-level-2" %}

            <main class="content" role="main">
              <section class="content-formatted">{% content %}</section>
            </main>
          </div>
        </div>
      </div>
    </div>

    {% include "footer" %}
  </div>

  {% include "javascripts" %}
  {% include "bg-picker" %}
  <script>
    {% unless body_image == nil or body_image == '' %}
      $.backstretch('{{ body_image }}');
    {% endunless %}

    site.initCommonPage();
  </script>
</body>
</html>
