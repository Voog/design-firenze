<!DOCTYPE html>
{% include "template-variables" %}
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% assign items_page = true %}
  {% include "edicy-tools-variables" %}
  {% include "edicy-tools" items_page: true %}
  {% include "html-head" items_page: true %}
  {% include "edicy-tools-styles" %}
</head>

<body class="item-list-page content-page {% unless editmode or site_header_has_content %} empty-site-header{% endunless %} js-bg-picker-area{% if fallback_state %} bgpicker-fallback{% endif %}">
  {% include "template-svg-spritesheet" %}
  {% if editmode %}<button class="bgpicker-btn js-background-settings" data-bg-key="body_bg" data-bg-default-image-color="rgb(161, 157, 157)" data-bg-image="{{ body_bg_image }}" data-bg-image-sizes="{{ body_bg_image_sizes_str | escape }}" data-bg-color="{{ body_bg_color }}" data-bg-color-data="{{ body_bg_color_data_str | escape }}"></button>{% endif %}
  {% if body_bg_image != '' or editmode %}<div class="body-background-image js-background-image"></div>{% endif %}
  {% if body_bg_color != '' or editmode %}<div class="body-background-color js-background-color"></div>{% endif %}

  {% include "topbar" %}

  <div class="container js-container">
    <div class="container-inner">
      <div class="wrap js-wrap">
        {% include "header" %}
        {% include "menu-level-2" %}

        <main class="content" role="main">

          <div class="content-gallery content-area">{% content name="gallery" %}</div>

          <section class="content-item-boxes">
            {% if site.root_item.selected? %}
              {% for level_1 in site.visible_menuitems_with_data %}
                {% if level_1.layout_title == product_list_layout or level_1.layout_title == product_layout %}
                  {% include "product-list-item" menu_level: level_1 %}
                {% endif %}
              {% endfor %}
              {% else %}
              {% include "product-list-loop" menu_items: site.visible_menuitems %}
            {% endif %}
          </section>

        </main>
      </div>
    </div>

    {% include "footer" %}
  </div>

  {% include "javascripts" %}
   <script>template.initItemsPage();</script>
</body>
</html>
