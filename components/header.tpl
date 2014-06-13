<header class="header">
  <div class="header-top">
    <div class="header-title content-formatted">{% unless editmode or site.root_item.selected? %}<a href="{{ site.root_item.url }}">{% endunless %}{% editable site.header %}{% unless editmode or site.root_item.selected? %}</a>{% endunless %}</div>

    <button class="menu-btn js-menu-btn">
      <span class="menu-stripe"></span>
      <span class="menu-stripe"></span>
      <span class="menu-stripe"></span>
    </button>

    {% unless site.root_item.selected? %}{% include 'header-options' %}{% endunless %}
  </div>

  <div class="header-bottom">
    <nav class="menu-main js-menu-main js-menu-popover">
      {% include "menu-level-1" %}
      {% if editmode or site.has_many_languages? %}
      <div class="menu-lang">
        {% include "menu-lang" %}
      </div>
      {% endif %}
    </nav>
  </div>
</header>
