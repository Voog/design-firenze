<header class="header js-header{% if site.search.enabled %} search-enabled{% endif %} {% if flags_state %}flags-enabled{% else %}flags-disabled{% endif %}">
  {% include "header-options" %}

  <div class="header-top">
    <div class="header-top-inner content-formatted">
      <div class="header-title">
        {% unless editmode or site.root_item.selected? %}<a class="header-link" href="{{ site.root_item.url }}">{% endunless %}{% editable site.header %}{% unless editmode or site.root_item.selected? %}</a>{% endunless %}
      </div>

      {% if front_page == true %}
        <main class="content" role="main">
          {%- assign content_default_title_tooltip = "content_tooltip_specific_page" | lce -%}
          <section class="content-formatted">{% content title_tooltip=content_default_title_tooltip %}</section>
        </main>
      {% endif %}
    </div>

    <button class="menu-btn js-menu-btn js-btn">
      <span class="menu-stripe"></span>
      <span class="menu-stripe"></span>
      <span class="menu-stripe"></span>
    </button>
  </div>

  <div class="header-bottom">
    <nav class="menu-main js-menu-main js-menu-popover js-popover">
      {% include "menu-level-1" %}
      {% if editmode or site.has_many_languages? %}
        <div class="menu-lang">
          {% include "menu-lang" %}
        </div>
      {% endif %}
    </nav>

    {% include "search" %}
  </div>
</header>
