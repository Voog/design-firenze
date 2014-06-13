<div class="header-options">
  {% if site.search.enabled %}
    <button class="search-btn">Search</button>
  {% endif %}

  {% if editmode or site.has_many_languages? %}
    <nav class="menu-lang">
      <button class="menu-lang-btn js-menu-lang-btn lang-flag {% for language in site.languages %}{% if language.selected? %}lang-flag-{{ language.code }}{% endif %}{% endfor %}">Choose language</button>
      <div class="menu-lang-popover js-menu-lang-popover js-menu-popover">
        {% include "menu-lang" %}
      </div>
    </nav>
  {% endif %}
</div>
