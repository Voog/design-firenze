<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
  <head>
    {% include "html-head" %}
    <meta property="og:url" content="{{ site.url }}">
    <meta property="og:title" content="{{ site.name }}">
    <meta property="og:description" content="{{ page.description }}">
    <meta property="og:image" content="{{ site.url }}{{ photos_path }}/{{ page.data.fbimage }}"><!-- TODO: Add image location data tag -->
  </head>

  <body class="common-page">
    <div class="container js-container">
      {% include "topbar" %}

      <div class="wrap">
        <div class="wrap-middle">
          <div class="wrap-inner">
            {% include "header" %}

            <main class="content" role="main">
              <section class="content-formatted">
                {% content %}
              </section>
            </main>

          </div>
          {% include "footer" %}
        </div>
      </div>
    </div>

    {% include "javascripts" %}
    <script src="{{ javascripts_path }}/autogrow.js"></script>
    <script src="{{ javascripts_path }}/ajaxForm.js"></script>
    <script>
      $('.form_field_textarea').autogrow();
      $(".content-formatted form").edicyAjaxForm();
      $.backstretch("{{ photos_path }}/common-page-bg.jpg");
    </script>
</body>
</html>
