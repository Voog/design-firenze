{% comment %} TODO: Optimize the logic.{% endcomment %}
{% capture dont_render %}
  {% comment %}Assign language menu flags state{% endcomment %}
  {% if site.data.flags_state == nil %}
    {% assign flags_state = true %}
  {% else %}
    {% assign flags_state = site.data.flags_state %}
  {% endif %}

  {% comment %}Assign variables based on page type.{% endcomment %}
  {% if edicy-tools-variables == 'article' %}
    {% assign fallback_body_image = article.data.body_image %}
    {% assign fallback_body_color = article.data.body_color %}
    {% assign body_bg = article.data.body_bg %}
  {% else %}
    {% assign fallback_body_image = page.data.body_image %}
    {% assign fallback_body_color = page.data.body_color %}
    {% assign body_bg = page.data.body_bg %}
  {% endif %}

  {% assign body_bg_image = body_bg.image %}
  {% assign body_bg_image_sizes = body_bg.imageSizes %}
  {% assign body_bg_color = body_bg.color %}
  {% assign body_bg_color_data = body_bg.colorData %}
  {% assign body_bg_combined_lightness = body_bg.combinedLightness %}

  {% comment %}Assign fallback image state{% endcomment %}
  {% if fallback_body_color != nil and body_bg.color == nil %}
    {% assign fallback_state = true %}
  {% endif %}

  {% comment %}Sets the body background color scheme.{% endcomment %}
  {% if body_bg %}
    {% if body_bg_combined_lightness %}
      {% if body_bg_combined_lightness > 0.6 %}
        {% assign body_bg_type = "light-background" %}
      {% else %}
        {% assign body_bg_type = "dark-background" %}
      {% endif %}
    {% else %}
      {% if body_bg_color_data.a >= 0.6 %}
        {% if body_bg_color_data.lightness >= 0.6 %}
          {% assign body_bg_type = "light-background" %}
        {% else %}
          {% assign body_bg_type = "dark-background" %}
        {% endif %}
      {% else %}
        {% assign body_bg_type = "light-background" %}
      {% endif %}
    {% endif %}
  {% else %}
    {% assign body_bg_type = "dark-background" %}
  {% endif %}

  {% if fallback_body_image != nil and body_bg.image == nil %}
    {% assign body_bg_image = fallback_body_image %}
  {% else %}
    {% if body_bg_image == nil %}
      {% if front_page %}
        {% assign body_bg_image_original = images_path | append: '/front-page-bg.jpg' %}
        {% assign body_bg_image = images_path | append: '/front-page-bg_block.jpg' %}
      {% elsif blog_page or post_page %}
        {% assign body_bg_image_original = images_path | append: '/blog-page-bg.jpg' %}
        {% assign body_bg_image = images_path | append: '/blog-page-bg_block.jpg' %}
      {% else %}
        {% assign body_bg_image_original = images_path | append: '/common-page-bg.jpg' %}
        {% assign body_bg_image = images_path | append: '/common-page-bg_block.jpg' %}
      {% endif %}
    {% endif %}
  {% endif %}

  {% if fallback_body_image != nil and body_bg.image == nil %}
    {% assign body_bg_image_sizes_str = '[{"url": "' | append: fallback_body_image | append: '", "width": 0, "height": 0}]' %}
  {% else %}
    {% if body_bg_image_sizes == nil %}
      {% if front_page %}
        {% assign body_bg_image_sizes_str = '[{"url": "' | append: images_path | append: '/front-page-bg.jpg", "width": 2560, "height": 1735}, {"url": "' | append: images_path | append: '/front-page-bg_huge.jpg", "width": 2048, "height": 1388}, {"url": "' | append: images_path | append: '/front-page-bg_large.jpg", "width":1280, "height":868}, {"url": "' | append: images_path | append: '/front-page-bg_block.jpg", "width":600, "height":407}]' %}
      {% elsif blog_page or post_page %}
        {% assign body_bg_image_sizes_str = '[{"url": "' | append: images_path | append: '/blog-page-bg.jpg", "width": 2560, "height": 1735}, {"url": "' | append: images_path | append: '/blog-page-bg_huge.jpg", "width": 2048, "height": 1388}, {"url": "' | append: images_path | append: '/blog-page-bg_large.jpg", "width": 1280, "height": 868}, {"url": "' | append: images_path | append: '/blog-page-bg_block.jpg", "width": 600, "height": 407}]' %}
      {% else %}
        {% assign body_bg_image_sizes_str = '[{"url": "' | append: images_path | append: '/common-page-bg.jpg", "width": 2560, "height": 1735}, {"url": "' | append: images_path | append: '/common-page-bg_huge.jpg", "width": 2048, "height": 1388}, {"url": "' | append: images_path | append: '/common-page-bg_large.jpg", "width": 1280, "height": 868}, {"url": "' | append: images_path | append: '/common-page-bg_block.jpg", "width": 600, "height": 407}]' %}
      {% endif %}
    {% else %}
      {% assign body_bg_image_sizes_str = body_bg_image_sizes | json %}
    {% endif %}
  {% endif %}

  {% if fallback_body_color != nil and body_bg.color == nil %}
    {% assign body_bg_color = fallback_body_color %}
  {% else %}
    {% if body_bg_color == nil %}
      {% assign body_bg_color = 'rgba(0,0,0,0.2)' %}
    {% endif %}
  {% endif %}

  {% if body_bg_color_data == nil %}
    {% assign body_bg_color_data_str = '{"r": 0, "g": 0, "b": 0, "a": 0.2, "lightness": 0}' %}
  {% else %}
    {% assign body_bg_color_data_str = body_bg_color_data | json %}
  {% endif %}
{% endcapture %}
