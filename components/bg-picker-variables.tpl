{% capture dont_render %}
  <!-- Sets the body background color value -->
  {% if page.data.body_color == nil %}
    {% assign body_color = '' %}
  {% else %}
    {% assign body_color = page.data.body_color %}
  {% endif %}

  <!-- Builds style tag for background image -->
  {% assign body_image_style = '' %}
  {% unless page.data.body_image == nil %}
    {% assign body_image_style = ' style="background-image: ' %}
    {% if page.data.body_image == '' %}
      {% assign body_image_style = body_image_style | append: 'none' %}
    {% else %}
      {% assign body_image_style = body_image_style | append: "url('" | append: page.data.body_image | append: "')" %}
    {% endif %}
    {% assign body_image_style = body_image_style | append: ';"' %}
  {% endunless %}

  <!-- Builds style tag for background color -->
  {% assign body_color_style = "" %}
  {% unless page.data.body_color == nil %}
    {% assign body_color_style = ' style="background-color: ' %}
    {% if page.data.body_color == '' %}
      {% assign body_color_style = body_color_style | append: 'none' %}
    {% else %}
      {% assign body_color_style = body_color_style | append: page.data.body_color %}
      {% if page.data.body_image == '' %}
        {% assign body_color_style = body_color_style | append: '; opacity: 1' %}
      {% else %}
        {% assign body_color_style = body_color_style | append: '; opacity: 0.5' %}
      {% endif %}
    {% endif %}
    {% assign body_color_style = body_color_style | append: ';"' %}
  {% endunless %}
{% endcapture %}
