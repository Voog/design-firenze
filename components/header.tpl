<header class="header js-header">
  <div class="header-inner">
    <section class="header-top">
      <div class="header-title">{% unless editmode %}<a href="{{ site.root_item.url }}">{% endunless %}{% editable site.header %}{% unless editmode %}</a>{% endunless %}</div>

      {% if editmode or site.has_many_languages? %}
        <nav class="lang-menu">
          <button class="lang-menu-btn js-lang-menu-btn lang-flag {% for language in site.languages %}{% if language.selected? %}{{ language.code }}{% endif %}{% endfor %}">Choose language</button>
          <div class="lang-menu-popover js-lang-menu-popover">
            {% include "lang-menu" %}
          </div>
        </nav>
      {% endif %}
    </section>

    <button class="menu-btn js-menu-btn">
      <span class="menu-stripe"></span>
      <span class="menu-stripe"></span>
      <span class="menu-stripe"></span>
    </button>

    <nav class="main-menu js-main-menu">
      {% include "nav-menu" %}
      {% if editmode or site.has_many_languages? %}
      <div class="mobile-lang-menu lang-menu">
          {% include "lang-menu" %}
        </div>
      {% endif %}
    </nav>
  </div>
</header>
