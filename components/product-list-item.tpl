{% unless menu_level.image %}
  {% assign item_image_state = "without-image" %}
{% else %}
  {% assign item_image_state = "with-image" %}

  {% if menu_level.image.width > menu_level.image.height %}
    {% assign item_image_orientation = "image-landscape" %}
  {% elsif menu_level.image.width == menu_level.image.height %}
    {% assign item_image_orientation = "image-square" %}
  {% else %}
    {% assign item_image_orientation = "image-portrait" %}
  {% endif %}

  {% if menu_level.data.image_crop_state %}
    {% assign item_image_crop_state = menu_level.data.image_crop_state %}
  {% else %}
    {% assign item_image_crop_state = "not-cropped" %}
  {% endif %}
{% endunless %}

{% if editmode %}
  <div class="content-item-box {{ item_image_state }} js-content-item-box" data-item-type="page" data-item-id="{{ menu_level.page_id }}">
    <div class="item-top">
      <button class="btn bg-crop-btn {% if item_image_orientation == "image-square" or menu_level.image == nil %}is-hidden{% else %}is-visible{% endif %} js-toggle-crop-state">
        <svg width="20" height="20" viewBox="0 0 28 28" xmlns="http://www.w3.org/2000/svg">
          <use xlink:href="#ico-toggle"></use>
        </svg>
      </button>

      <div class="loader js-loader"></div>
      <div class="top-inner aspect-ratio-inner image-drop-area {{ item_image_orientation }} {{ item_image_crop_state }} js-content-item-img-drop-area" data-image="{{ menu_level.image.for-width-680.schemeless_url }}"></div>
    </div>

    <h2 class="item-title">
      <a class="item-link" href="{{ menu_level.url }}">{{ menu_level.title }}</a>
    </h2>
  </div>
{% else %}
  <a class="content-item-box {{ item_image_state }} js-content-item-box" href="{{ menu_level.url }}">
    <div class="item-top">
      <div class="top-inner aspect-ratio-inner">
        {% if menu_level.image %}
          <div class="loader js-loader"></div>
          <img class="item-image {{ item_image_orientation }} {{ item_image_crop_state }} js-lazyload" data-original="{{ menu_level.image.for-width-680.schemeless_url }}">
        {% else %}
          <div class="item-placeholder">{{ menu_level.title | truncate: 50 }}</div>
        {% endif %}
      </div>
    </div>

    <h2 class="item-title">{{ menu_level.title }}</h2>
  </a>
{% endif %}
