<section class="topbar js-topbar">
  <div class="wrap">
    <nav class="menu-main">
      {% include "menu-level-1" %}
    </nav>

    {% if page.blog? == true %}
      {% if topbar == "article" %}
        {% if site.has_language_tags? %}
          {% include "topbar-tags-post" %}
        {% endif %}
      {% else %}
        {% include "topbar-tags-blog" %}
      {% endif %}
    {% endif %}
  </div>
</section>
