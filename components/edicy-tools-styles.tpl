<style>
  {% if fallback_body_image != nil and body_bg.image == nil %}
    .body-background-image {
      background-image: url("{{ fallback_body_image }}");
    }
  {% else %}
    {% if body_bg.image != nil %}
      {% for image_size in body_bg_image_sizes %}
        {% if forloop.first %}
          .body-background-image {
            background-image: url("{{ image_size.url }}");
          }
        {% else %}
          @media screen and (max-width: {{ image_size.width }}px) and (max-height: {{ image_size.height }}px) {
            .body-background-image {
              background-image: url("{{ image_size.url }}");
            }
          }
        {% endif %}
      {% endfor %}

    {% else %}

      {% if front_page %}
        {% assign bg_image_prefix = images_path | append: "/front-page-bg" %}
      {% elsif blog_page or post_page %}
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

  {% if fallback_body_image != nil and body_bg.image == nil %}
    .body-background-color {
      background-color: {{ fallback_body_color }};
    }
  {% else %}
    {% if body_bg.color != nil %}
      .body-background-color {
        background-color: {{ body_bg_color }};
      }
    {% else %}
      .body-background-color {
        background-color: rgba(0,0,0,0.2);
      }
    {% endif %}
  {% endif %}
</style>
