<div class="tags">
  {% include "tags-translations" %}

  {% unless article.tags == empty %}
    <button class="tags-btn js-tags-btn">Browse by tags</button>
    <nav class="menu-tags js-menu-tags">
      <ul class="menu">
        <li><a href="/{{ site.blogs.first.page.path }}">{{ tags_all }}</a></li>
        {% for tag in article.tags %}
          <li><a href="/{{ site.blogs.first.page.path }}/tagged/{{ tag.path }}">{{ tag.name }}</a></li>
        {% endfor %}
      </ul>
    </nav>
  {% endunless %}
</div>
