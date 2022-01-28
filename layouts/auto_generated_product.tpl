<!DOCTYPE html>
{% include "template-variables" %}

<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% assign items_page = true %}
  {% include "edicy-tools-variables" %}
  {% include "html-head" %}
  {% include "edicy-tools-styles" %}
</head>

<body class="item-page content-page{% unless editmode or site_header_has_content %} empty-site-header{% endunless %} js-bg-picker-area{% if fallback_state %} bgpicker-fallback{% endif %}">
  {% include "template-svg-spritesheet" %}
{% if editmode %}<button class="bgpicker-btn js-background-settings" data-bg-key="body_bg" data-bg-default-image-color="rgb(111, 108, 119)" data-bg-image="{{ body_bg_image }}" data-bg-image-sizes="{{ body_bg_image_sizes_str | escape }}" data-bg-color="{{ body_bg_color }}" data-bg-color-data="{{ body_bg_color_data_str | escape }}"></button>{% endif %}
{% if body_bg_image != '' or editmode %}<div class="body-background-image js-background-image"></div>{% endif %}
{% if body_bg_color != '' or editmode %}<div class="body-background-color js-background-color"></div>{% endif %}

  {%- capture _button_attributes %}
    data-product-id="{{ product.id }}"
    data-product="{{ product | json | escape }}"
    data-settings="{&quot;title&quot;:&quot;{{ "add_to_cart" | lc | escape_once }}&quot;,&quot;button_style&quot;:&quot;with_price&quot;}"
  {% endcapture -%}

  {% include "topbar" %}

  <div class="container js-container">
    <div class="container-inner">
      <div class="wrap js-wrap">
        {% include "header" %}
        <main class="content" role="main">
          <div class="items-body">
            <div class="content-illustrations">
              {%- assign productImage = product.image -%}
              {%- if productImage != blank %}
                {% assign item_image_state = "with-image" %}
              {% else %}
                {% assign item_image_state = "without-image" %}
              {% endif -%}

              <div class="content-item-box {{ item_image_state }} js-content-item-box">
                <div class="item-top">
                  {%- if productImage != blank -%}
                    <div class="loader js-loader"></div>
                    <div class="top-inner aspect-ratio-inner">
                      {%- assign imageClass = "item-image " | append: "not-cropped" -%}
                      {% image productImage target_width: "1280" class: imageClass loading: "lazy" %}
                    </div>
                  {%- endif -%}
                </div>
              </div>

              <div class="content-formatted" data-search-indexing-allowed="true">
                {% content bind=product name="gallery" %}
              </div>
            </div>

            <div class="content-body">
              <header class="content-header">
                <div class="content-item-title content-formatted">
                  <h1>{%- editable product.name -%}</h1>
                </div>
              </header>

              <div class="content-formatted" data-search-indexing-allowed="true" {{ edy_intro_edit_text }}>
                {%- if editmode or product.description != blank -%}
                  <div class="content-product-description">
                  {%- editable product.description -%}
                  </div>
                {%- endif -%}

                {% content bind=product %}
                {% include "buy-button" %}
              </div>
            </div>
          </div>
        </main>
      </div>
    </div>

    {% include "footer" %}
  </div>

  {% include "javascripts" %}
  {% include "edicy-tools" %}
</body>
</html>
