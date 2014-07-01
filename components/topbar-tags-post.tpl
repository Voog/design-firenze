<div class="tags">
  {% unless article.tags == empty %}
    <button class="tags-btn js-tags-btn js-btn">{{ 'browse_by_tags' | lc }}</button>
    <nav class="menu-tags js-menu-tags js-popover">
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
