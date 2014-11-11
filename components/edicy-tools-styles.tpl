<style>
  {% if edicy-tools-styles == "article" %}
    {% assign fallback_image = article.data.body_image %}
    {% assign fallback_color = article.data.body_color %}
  {% else %}
    {% assign fallback_image = page.data.body_image %}
    {% assign fallback_color = page.data.body_color %}
  {% endif %}

  {% if (fallback_image != nil and fallback_image != "") and body_bg.image == nil %}
    .body-background-image {
      background-image: url("{{ fallback_image }}");
    }

  {% else %}

    {% if body_bg.image != nil %}
      {% for imageSize in page.data.body_bg.imageSizes %}
        {% if forloop.first %}
          .body-background-image {
            background-image: url("{{ imageSize.url }}");
          }
        {% else %}
          @media screen and (max-width: {{ imageSize.width }}px) and (max-height: {{ imageSize.height }}px) {
            .body-background-image {
              background-image: url("{{ imageSize.url }}");
            }
          }
        {% endif %}
      {% endfor %}

    {% else %}

      {% if front_page %}
        {% assign bg_image_prefix = images_path | append: "/front-page-bg" %}
      {% elsif blog_page %}
        {% assign bg_image_prefix = images_path | append: "/blog-page-bg" %}
      {% else %}
        {% assign bg_image_prefix = images_path | append: "/common-page-bg" %}
      {% endif %}

      .body-background-image {
        background-image: url("{{ bg_image_prefix }}.jpg");
      }

      @media screen and (max-width: 2048px) and (max-height: 1388px) {
        .body-background-image {
          background-image: url("{{ bg_image_prefix }}_huge.jpg");
        }
      }

      @media screen and (max-width: 1280px) and (max-height: 868px) {
        .body-background-image {
          background-image: url("{{ bg_image_prefix }}_large.jpg");
        }
      }

      @media screen and (max-width: 600px) and (max-height: 407px) {
        .body-background-image {
          background-image: url("{{ bg_image_prefix }}_block.jpg");
        }
      }
    {% endif %}
  {% endif %}

  {% if (fallback_color != nil and fallback_color != "") and body_bg.color == nil %}
    .body-background-color {
      background-color: {{ fallback_color }};
    }

  {% else %}

    {% if body_bg.color %}
      .body-background-color {
        background-color: {{ page.data.body_bg.color }};
      }
    {% else %}
      .body-background-color {
        background-color: {{ body_bg_color }};
      }
    {% endif %}
  {% endif %}
</style>
