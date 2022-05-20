<!DOCTYPE html>
{%- include "template-settings" -%}
{%- include "template-variables" -%}

<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% assign items_page = true %}
  {% assign product_page = true %}
  {% include "edicy-tools-variables" with "product_page" %}
  {% include "html-head" %}
  {% include "edicy-tools-styles" %}
</head>

<body class="item-page product-page content-page{% unless editmode or site_header_has_content %} empty-site-header{% endunless %} js-bg-picker-area{% if fallback_state %} bgpicker-fallback{% endif %}">
  {% include "template-svg-spritesheet" %}
  {% if editmode %}
    <button
      class="bgpicker-btn js-background-settings"
      data-bg-key="{{ body_bg_key }}"
      data-bg-default-image-color="rgb(111, 108, 119)"
      data-bg-image="{{ body_bg_image }}"
      data-bg-image-sizes="{{ body_bg_image_sizes_str | escape }}"
      data-bg-color="{{ body_bg_color }}"
      data-bg-color-data="{{ body_bg_color_data_str | escape }}">
    </button>
  {% endif %}

  {% if body_bg_image != '' or editmode %}<div class="body-background-image js-background-image"></div>{% endif %}
  {% if body_bg_color != '' or editmode %}<div class="body-background-color js-background-color"></div>{% endif %}

  {%- capture bottom_content_html -%}
    {%- unless editmode -%}
      {%- content bind=product name="content" -%}
    {%- endunless -%}
  {%- endcapture -%}

  {%- assign bottom_content_size = bottom_content_html | strip | size -%}

  {%- capture gallery_content_html -%}
    {%- unless editmode -%}
      {%- content bind=product name="gallery" -%}
    {%- endunless -%}
  {%- endcapture -%}

  {%- assign gallery_content_size = gallery_content_html | strip | size -%}

  {%- capture product_social_html -%}
    {%- unless editmode -%}
      {%- xcontent name="product-social" -%}
    {%- endunless -%}
  {%- endcapture -%}

  {%- assign product_social_size = product_social_html | strip | size -%}

  {% include "topbar" %}

  <div class="container js-container">
    <div class="container-inner">
      <div class="wrap js-wrap">
        {% include "header" %}
        <main class="content product-content" role="main">
          {% include "menu-breadcrumbs-sd" %}
          <div class="items-body">
            <div class="flex-col mar_r-40">
              <div class="content-illustrations product-illustrations">

                {%- if product.image != blank %}
                  {% assign item_image_state = "with-image" %}
                {% else %}
                  {% assign item_image_state = "without-image" %}
                {% endif -%}

                <div class="content-item-box {{ item_image_state }} js-content-item-box">
                  <div class="item-top product-image">
                    {%- if product.image != blank -%}
                      <div class="top-inner aspect-ratio-inner">
                        {%- assign image_class = "item-image " | append: "not-cropped" -%}
                        {% image product.image target_width: "600" class: image_class loading: "lazy" %}
                      </div>
                    {%- endif -%}
                  </div>
                </div>
                {% if editmode or gallery_content_size > 0 %}
                  <div class="content-formatted js-product-gallery" data-search-indexing-allowed="true">
                    {%- assign gallery_title = "gallery" | lce -%}
                    {%- assign gallery_title_tooltip = "content_tooltip_additional_images" | lce -%}
                    {% content bind=product name="gallery" title=gallery_title title_tooltip=gallery_title_tooltip %}
                  </div>
                {% endif %}
              </div>
            </div>
            <div class="flex-col">
              <div class="content-body">
                <div class="content-body-inner js-product-right-content">
                  <header class="content-header">
                    <div class="content-item-title content-formatted product-item-title">
                      <h1>{%- editable product.name -%}</h1>
                    </div>
                  </header>

                  <div class="product-price">
                    {%- if product.price_max_with_tax != product.price_min_with_tax -%}
                      {{ product.price_min_with_tax | money_with_currency: product.currency -}}
                      <span class="product-price-divider">–</span>
                    {%- endif -%}
                    {{ product.price_max_with_tax | money_with_currency: product.currency -}}
                  </div>

                  <div class="content-formatted" data-search-indexing-allowed="true" {{ edy_intro_edit_text }}>
                    {%- if editmode or product.description != blank -%}
                      <div class="content-product-description">
                      {%- editable product.description -%}
                      </div>
                    {%- endif -%}

                    <div class="buy-btn-content js-buy-btn-content">
                      {% include "buy-button" %}
                    </div>

                    {%- if editmode or product_social_size > 0 -%}
                      <div class="product-cross-page-info">
                        {%- assign cross_page_info_title = "cross_page_info" | lce -%}
                        {%- assign cross_page_info_title_tooltip = "content_tooltip_all_pages_same_type" | lce -%}
                        {% xcontent name="product-social" title=cross_page_info_title title_tooltip=cross_page_info_title_tooltip %}
                      </div>
                    {%- endif -%}

                    {%- assign content_title = "content" | lce -%}
                    {%- assign content_title_tooltip = "content_tooltip_specific_page" | lce -%}
                    {% content bind=product title=content_title title_tooltip=content_title_tooltip %}
                  </div>
                </div>
              </div>
            </div>
          </div>
          {%- if bottom_content_size > 0 or editmode -%}
            <section
              class="content-product-wide content-area"
              data-search-indexing-allowed="true">
              {%- assign bottom_content_title = "additional_content" | lce -%}
              {%- assign bottom_content_title_tooltip = "content_tooltip_additional_information" | lce -%}
              {% content bind=product name="content" title=bottom_content_title title_tooltip=bottom_content_title_tooltip %}
            </section>
          {%- endif -%}
        </main>
      </div>
    </div>

    {% include "footer" %}
  </div>

  {% include "javascripts" %}
  {% include "edicy-tools" %}

  <script>
    if (site) {
      site.handleProductPageContent();

      {%- if product and editmode -%}
        site.handleProductImageClick({{ product.id }});
      {% endif %}
    }
  </script>
</body>
</html>
