<div class="tags">
  {% include "tags-variables" %}
  <button class="tags-btn js-tags-btn">{{ tags_button }}</button>

  <nav class="menu-tags js-menu-tags">
    <ul class="menu">
      <li class="menu-item">
        <a class="menu-link js-tags-all" href="/{{ page.path }}">{{ tags_all }}</a>
      </li>
      {% for tag in site.language_tags %}
        {% assign activestr = " " %}
        {% for tmptag in tags %}
          {% if tmptag.name == tag.name %}
            {% assign activestr = " active" %}
          {% endif %}
        {% endfor %}
        <li class="menu-item">
          <a class="menu-link{{ activestr }}" href="/{{ page.path }}/tagged/{{ tag.path }}">{{ tag.name }}</a>
        </li>
      {% endfor %}
    </ul>
  </nav>
</div>