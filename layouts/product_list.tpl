<!DOCTYPE html>
{%- include "template-settings" -%}
{%- include "template-variables" -%}
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% assign items_page = true %}
  {% include "edicy-tools-variables" %}
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
        <main class="content" role="main">
          {%- assign page_title_content_title = "title" | lce -%}
          {%- assign page_title_content_title_tooltip = "content_tooltip_current_page_title" | lce -%}
          <div class="intro-content content-formatted" data-search-indexing-allowed="true" {{ edy_intro_edit_text }}>{% content title=page_title_content_title title_tooltip=page_title_content_title_tooltip %}</div>
          {% include "menu-breadcrumbs" %}
          <section class="content-item-boxes">
            {% if site.root_item.selected? %}
              {% for level_1 in site.menuitems_with_data %}
                {% if level_1.layout_title == product_list_layout or level_1.layout_title == product_layout %}
                  {% include "product-list-item" menu_level: level_1 %}
                {% endif %}
              {% endfor %}
              {% else %}
              {% include "product-list-loop" %}
            {% endif %}
          </section>

        </main>
      </div>
    </div>

    {% include "footer" %}
  </div>

  {% include "javascripts" %}
  {% include "edicy-tools" items_page: true  %}
   <script>site.initItemsPage();</script>
</body>
</html>
