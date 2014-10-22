{% comment %} TODO: Optimize the logic.{% endcomment %}
{% capture dont_render %}
  {% comment %}Assign variables based on page type.{% endcomment %}
  {% if edicy-tools-variables == "article" %}
    {% assign body_bg = article.data.body_bg %}
    {% assign body_bg_image = article.data.body_bg.image %}
    {% assign body_bg_image_sizes = article.data.body_bg.imageSizes %}

    {% assign body_bg_color_data = article.data.body_bg.colorData %}
    {% assign body_bg_color = article.data.body_bg.color %}
    {% assign body_bg_color_opacity = article.data.body_bg.colorData.a %}
    {% assign body_bg_color_lightness = article.data.body_bg.colorData.lightness %}
  {% else %}
    {% assign body_bg = page.data.body_bg %}
    {% assign body_bg_image = page.data.body_bg.image %}
    {% assign body_bg_image_sizes = page.data.body_bg.imageSizes %}

    {% assign body_bg_color = page.data.body_bg.color %}
    {% assign body_bg_color_data = page.data.body_bg.colorData %}
    {% assign body_bg_color_opacity = page.data.body_bg.colorData.a %}
    {% assign body_bg_color_lightness = page.data.body_bg.colorData.lightness %}
  {% endif %}

  {% comment %}Sets the body background type.{% endcomment %}
  {% if body_bg %}
    {% if body_bg_color_opacity >= 0.16 %}
      {% if body_bg_color_lightness >= 0.2 %}
        {% assign body_bg_type = 'light-background' %}
      {% else %}
        {% assign body_bg_type = 'dark-background' %}
      {% endif %}
    {% else %}
      {% assign body_bg_type = 'light-background' %}
    {% endif %}
  {% else %}
    {% assign body_bg_type = 'dark-background' %}
  {% endif %}

  {% if body_bg_image == nil %}
    {% if front_page %}
      {% assign body_bg_image = images_path | append: '/front-page-bg_block.jpg' %}
    {% elsif blog_page %}
      {% assign body_bg_image = images_path | append: '/blog-page-bg_block.jpg' %}
    {% else %}
      {% assign body_bg_image = images_path | append: '/common-page-bg_block.jpg' %}
    {% endif %}
  {% endif %}

  {% if body_bg_image_sizes == nil %}
    {% if front_page %}
      {% assign body_bg_image_sizes_str = '{"url":"' | append: images_path | append: '/front-page-bg.jpg", "height":1735, "width":2560}{"url":"' | append: images_path | append: '/front-page-bg_huge.jpg", "height":1388, "width":2048}{"url":"' | append: images_path | append: '/front-page-bg_large.jpg", "height":868, "width":1280}{"url":"' | append: images_path | append: '/front-page-bg_block.jpg", "height":407, "width":600}' %}
    {% elsif blog_page %}
      {% assign body_bg_image_sizes_str = '{"url":"' | append: images_path | append: '/blog-page-bg.jpg", "height":1735, "width":2560}{"url":"' | append: images_path | append: '/blog-page-bg_huge.jpg", "height":1388, "width":2048}{"url":"' | append: images_path | append: '/blog-page-bg_large.jpg", "height":868, "width":1280}{"url":"' | append: images_path | append: '/blog-page-bg_block.jpg", "height":407, "width":600}' %}
    {% else %}
      {% assign body_bg_image_sizes_str = '{"url":"' | append: images_path | append: '/common-page-bg.jpg", "height":1735, "width":2560}{"url":"' | append: images_path | append: '/common-page-bg_huge.jpg", "height":1388, "width":2048}{"url":"' | append: images_path | append: '/common-page-bg_large.jpg", "height":868, "width":1280}{"url":"' | append: images_path | append: '/common-page-bg_block.jpg", "height":407, "width":600}' %}
    {% endif %}
  {% else %}
    {% assign body_bg_image_sizes_str = body_bg_image_sizes | json %}
  {% endif %}

  {% if body_bg_color_data == nil %}
    {% assign body_bg_color_data_str = '{"r": 0, "g": 0, "b": 0, "a": 0.2, "lightness": 0}' %}
  {% else %}
    {% assign body_bg_color_data_str = body_bg_color_data | json %}
  {% endif %}

  {% if body_bg_color == nil %}
    {% assign body_bg_color = 'rgba(0,0,0,0.2)' %}
  {% endif %}
{% endcapture %}
