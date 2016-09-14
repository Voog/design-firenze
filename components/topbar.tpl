<section class="topbar js-topbar">
  <div class="wrap">
    <nav class="menu-main{% if page.blog? == true %}{% if site.has_language_tags? %} narrow{% endif %}{% endif %}">
      {% include "menu-level-1" with "topbar" %}
    </nav>

    {% if page.blog? == true %}
      {% if site.has_language_tags? %}
        {% if topbar == "article" %}
          {% include "topbar-tags-post" %}
        {% else %}
          {% include "topbar-tags-blog" %}
        {% endif %}
      {% endif %}
    {% endif %}
  </div>
</section>
