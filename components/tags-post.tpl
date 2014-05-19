<div class="tags">
  {% include "tags-translations" %}
  {% unless article.tags == empty %}<span class="tags-title">{{ tags_title }}</span>{% endunless %}
  {% if editmode %}
    <div class="tags-editor">{% editable article.tags %}</div>
  {% else %}
    {% unless article.tags == empty %}
      <nav class="menu-tags">
        <ul class="menu">
          <li><a href="/{{ site.blogs.first.page.path }}">{{ tags_all }},</a></li>
          {% for tag in article.tags %}
            <li><a href="/{{ site.blogs.first.page.path }}/tagged/{{ tag.path }}">{{ tag.name }}</a>{% unless forloop.last %}, {% endunless %}</li>
          {% endfor %}
        </ul>
      </nav>
    {% endunless %}
  {% endif %}
</div>
