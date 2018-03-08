<!DOCTYPE html>
{% include "template-variables" %}

{% unless page.image %}
  {% assign page_image_state = "without-image" %}
{% else %}
  {% assign page_image_state = "with-image" %}

  {% if page.image.width > page.image.height %}
    {% assign page_image_orientation = "image-landscape" %}
  {% elsif page.image.width == page.image.height %}
    {% assign page_image_orientation = "image-square" %}
  {% else %}
    {% assign page_image_orientation = "image-portrait" %}
  {% endif %}

  {% if page.data.image_crop_state %}
    {% assign page_image_crop_state = page.data.image_crop_state %}
  {% else %}
    {% assign page_image_crop_state = "not-cropped" %}
  {% endif %}
{% endunless %}


<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "edicy-tools-variables" %}
  {% include "html-head" %}
  {% include "edicy-tools-styles" %}
</head>

<body class="item-page content-page{% unless editmode or site_header_has_content %} empty-site-header{% endunless %} js-bg-picker-area{% if fallback_state %} bgpicker-fallback{% endif %}">
  {% include "template-svg-spritesheet" %}
{% if editmode %}<button class="bgpicker-btn js-background-settings" data-bg-key="body_bg" data-bg-default-image-color="rgb(111, 108, 119)" data-bg-image="{{ body_bg_image }}" data-bg-image-sizes="{{ body_bg_image_sizes_str | escape }}" data-bg-color="{{ body_bg_color }}" data-bg-color-data="{{ body_bg_color_data_str | escape }}"></button>{% endif %}
{% if body_bg_image != '' or editmode %}<div class="body-background-image js-background-image"></div>{% endif %}
{% if body_bg_color != '' or editmode %}<div class="body-background-color js-background-color"></div>{% endif %}

  {% include "topbar" %}

  <div class="container js-container">
    <div class="container-inner">
      <div class="wrap js-wrap">
        {% include "header" %}
        {% include "menu-breadcrumbs" %}
        <main class="content" role="main">

            <div class="items-body">
              <div class="content-illustrations">
                {% if editmode %}
                  <div class="content-item-box {{ page_image_state }} js-content-item-box" data-item-type="page" data-item-id="{{ page.page_id }}">
                    <div class="item-top">
                      <button class="btn bg-crop-btn {% if page_image_orientation == "image-square" or page.image == nil %}is-hidden{% else %}is-visible{% endif %} js-toggle-crop-state">
                        <svg width="20" height="20" viewBox="0 0 28 28" xmlns="http://www.w3.org/2000/svg">
                          <use xlink:href="#ico-toggle"></use>
                        </svg>
                      </button>

                      <div class="loader js-loader"></div>
                      <div class="top-inner aspect-ratio-inner image-drop-area {{ page_image_orientation }} {{ page_image_crop_state }} js-content-item-img-drop-area" data-image="{{ page.image.for-width-680.schemeless_url }}"></div>
                    </div>
                  </div>
                {% else %}
                  {% if page.image %}
                    <div class="content-item-box {{ page_image_state }} js-content-item-box" href="{{ page.url }}">
                      <div class="item-top">
                        <div class="top-inner aspect-ratio-inner">
                          {% if page.image %}
                            <div class="loader js-loader"></div>
                            <img class="item-image {{ page_image_orientation }} {{ page_image_crop_state }} js-lazyload" data-original="{{ page.image.for-width-680.schemeless_url }}">
                          {% else %}
                            <div class="item-placeholder">{{ page.title | truncate: 50 }}</div>
                          {% endif %}
                        </div>
                      </div>
                    </div>
                  {% endif %}
                {% endif %}

                <div class="content-gallery content-area">{% content name="gallery" %}</div>
              </div>

              <div class="content-body">
                <header class="content-header">
                  <div class="content-item-title content-area">{% contentblock name="content_header_test" publish_default_content="true" %}<h1>{{ page.title }}</h1>{% endcontentblock %}</div>
                </header>

                <div class="content-area area-normal" data-search-indexing-allowed="true" {{ edy_intro_edit_text }}>{% contentblock %}{{ "write_product_description_here" | lc: editor_locale }}{% endcontentblock %}</div>
              </div>
            </div>
        </main>
      </div>
    </div>

    {% include "footer" %}
  </div>

  {% include "javascripts" %}
  {% include "edicy-tools" items_page: true %}
  <script>template.initItemsPage();</script>
</body>
</html>
