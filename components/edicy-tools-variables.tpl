{% capture dont_render %}
  {% if edicy-tools-variables == "article" %}

    <!-- Sets the body background color value for article pages-->
    {% if article.data.body_color == nil %}
      {% assign body_color = 'rgba(0,0,0,0.2)' %}
    {% else %}
      {% assign body_color = article.data.body_color %}
    {% endif %}

    <!-- Builds style tag for background color for article pages -->
    {% assign body_color_style = ' style="background: ' %}
    {% if body_color == '' %}
      {% assign body_color_style = body_color_style | append: 'none' %}
    {% else %}
      {% assign body_color_style = body_color_style | append: body_color %}
    {% endif %}
    {% assign body_color_style = body_color_style | append: ';"' %}

  {% else %}

    <!-- Sets the body background color value for content pages -->
    {% if page.data.body_color == nil %}
      {% assign body_color = 'rgba(0, 0, 0, 0.2)' %}
    {% else %}
      {% assign body_color = page.data.body_color %}
    {% endif %}

    <!-- Builds style tag for background color for content pages -->
    {% assign body_color_style = ' style="background: ' %}
    {% if body_color == '' %}
      {% assign body_color_style = body_color_style | append: 'none' %}
    {% else %}
      {% assign body_color_style = body_color_style | append: body_color %}
    {% endif %}
    {% assign body_color_style = body_color_style | append: ';"' %}

  {% endif %}
{% endcapture %}
