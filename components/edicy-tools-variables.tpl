{% capture dont_render %}
  {% if edicy-tools-variables == "article" %}
    {% comment %}Sets the body background image value for article pages{% endcomment %}
    {% if article.data.body_image == nil %}
      {% assign body_image = images_path | append: '/blog-page-bg.jpg' %}
    {% else %}
      {% assign body_image = article.data.body_image %}
    {% endif %}

    {% comment %}Sets the body background color value for article pages{% endcomment %}
    {% if article.data.body_color == nil %}
      {% assign body_color = 'rgba(0,0,0,0.2)' %}
    {% else %}
      {% assign body_color = article.data.body_color %}
    {% endif %}

  {% else %}

    {% if common_page == true %}
      {% comment %}Sets the body background image value{% endcomment %}
      {% if page.data.body_image == nil %}
        {% assign body_image = images_path | append: '/common-page-bg.jpg' %}
      {% else %}
        {% assign body_image = page.data.body_image %}
      {% endif %}
    {% elsif blog_page == true %}
      {% comment %}Sets the body background image value for blog pages{% endcomment %}
      {% if page.data.body_image == nil %}
        {% assign body_image = images_path | append: '/blog-page-bg.jpg' %}
      {% else %}
        {% assign body_image = page.data.body_image %}
      {% endif %}
    {% elsif front_page == true %}
      <script>alert('tere');</script>
      {% comment %}Sets the body background image value{% endcomment %}
      {% if page.data.body_image == nil %}
        {% assign body_image = images_path | append: '/front-page-bg.jpg' %}
      {% else %}
        {% assign body_image = page.data.body_image %}
      {% endif %}
    {% endif %}

    {% comment %}Sets the body background color value for content pages{% endcomment %}
    {% if page.data.body_color == nil %}
      {% assign body_color = 'rgba(0, 0, 0, 0.2)' %}
    {% else %}
      {% assign body_color = page.data.body_color %}
    {% endif %}
  {% endif %}

  {% comment %}Builds style tag for background image{% endcomment %}
  {% assign body_image_style = ' style="background-image: ' %}
  {% if body_image == '' %}
    {% assign body_image_style = body_image_style | append: 'none' %}
  {% else %}
    {% assign body_image_style = body_image_style | append: "url('" | append: body_image | append: "')" %}
  {% endif %}
  {% assign body_image_style = body_image_style | append: ';"' %}

  {% comment %}Builds style tag for background color{% endcomment %}
  {% assign body_color_style = ' style="background: ' %}
  {% if body_color == '' %}
    {% assign body_color_style = body_color_style | append: 'none' %}
  {% else %}
    {% assign body_color_style = body_color_style | append: body_color %}
  {% endif %}
  {% assign body_color_style = body_color_style | append: ';"' %}
{% endcapture %}
