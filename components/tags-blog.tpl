<div class="tags">
  {% include "tags-translations" %}
  <button class="tags-btn js-tags-btn">Browse by tags</button>

  <nav class="menu-tags js-menu-tags">
    <ul class="menu">
      <li>
        <a class="js-tags-all" href="/{{ site.blogs.first.page.path }}">{{ tags_all }}</a>
      </li>
      {% for tag in site.language_tags %}
        {% assign activestr = " " %}
        {% for tmptag in tags %}
          {% if tmptag.name == tag.name %}
            {% assign activestr = 'class="active"' %}
          {% endif %}
        {% endfor %}
        <li><a {{ activestr }} href="/{{ site.blogs.first.page.path }}/tagged/{{ tag.path }}">{{ tag.name }}</a></li>
      {% endfor %}
    </ul>
  </nav>
</div>
