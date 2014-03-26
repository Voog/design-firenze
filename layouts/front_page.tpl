<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
  <head>
    {% include "html-head" %}
    <meta property="og:url" content="{{ site.url }}">
    <meta property="og:title" content="{{ site.name }}">
    <meta property="og:description" content="{{ page.description }}">
    <meta property="og:image" content="{{ site.url }}{{ photos_path }}/{{ page.data.fbimage }}"><!-- TODO: Add image location data tag -->
  </head>

  <body class="front-page">
    <div class="container js-container">

      {% if editmode or site.has_many_languages? %}
        <nav class="lang-menu">
          <button class="lang-menu-btn js-lang-menu-btn lang-flag {% for language in site.languages %}{% if language.selected? %}{{ language.code }}{% endif %}{% endfor %}">Choose language</button>
          <div class="lang-menu-popover js-lang-menu-popover">
            {% include "lang-menu" %}
          </div>
        </nav>
      {% endif %}

      <div class="wrap">
        <div class="wrap-middle">
          <header class="header">
            <section class="content-formatted">{% contentblock name="front_page_title" %}<h1>Paesaggio Toscano</h1>{% endcontentblock %}</section>

            <nav class="main-menu">
              {% include "nav-menu" %}
            </nav>
          </header>
        </div>
      </div>

      {% include "footer" %}
    </div>

    {% include "javascripts" %}
    <script src="{{ javascripts_path }}/autogrow.js"></script>
    <script src="{{ javascripts_path }}/ajaxForm.js"></script>
    <script>
      $('.form_field_textarea').autogrow();
      $(".content-formatted form").edicyAjaxForm();
      $.backstretch("{{ photos_path }}/front-page-bg.jpg");
    </script>
  </body>
</html>
