{% if editmode %}
  <div class="tags">
    <div class="tags-editor">{% editable article.tags %}</div>
  </div>
{% else %}
  {% unless article.tags == empty %}
    <div class="tags">
      <span class="tags-title">{{ 'tags' | lc }}</span>
      <nav class="menu-tags menu-sub">
        <ul class="menu">
          {% for tag in article.tags %}
            <li class="menu-item"><a class="menu-link" href="/{{ article.page.path_with_lang }}/tagged/{{ tag.path }}">{{ tag.name }}</a></li>
          {% endfor %}
        </ul>
      </nav>
    </div>
  {% endunless %}
{% endif %}
