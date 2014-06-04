<div class="tags">
  {% include "tags-variables" %}
  {% unless article.tags == empty %}
    <button class="tags-btn js-tags-btn">{{ tags_button }}</button>
    <nav class="menu-tags js-menu-tags">
      <ul class="menu">
        <li class="menu-item">
          <a class="menu-link" href="/{{ page.path }}">{{ tags_all }}</a>
        </li>
        {% for tag in article.tags %}
          <li class="menu-item">
            <a class="menu-link" href="/{{ page.path }}/tagged/{{ tag.path }}">{{ tag.name }}</a>
          </li>
        {% endfor %}
      </ul>
    </nav>
  {% endunless %}
</div>
