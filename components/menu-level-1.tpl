<ul class="menu">
  {% unless site.root_item.hidden? %}
    <li class="menu-item">
      <a class="menu-link{% if site.root_item.selected? %} active{% endif %}" href="{{ site.root_item.url }}">{{ site.root_item.title }}</a>
    </li>
  {% endunless %}

  {% for item in site.visible_menuitems %}
    <li class="menu-item">
      <a class="menu-link{% if item.selected? %} active{% endif %}{% unless item.translated? %} untranslated fci-editor-menuadd{% endunless %}" href="{{ item.url }}">{{ item.title }}</a>
    </li>
  {% endfor %}

  {% if editmode %}
    {% if site.hidden_menuitems.size > 0 %}
      <li class="edit-btn">{% menubtn site.hidden_menuitems %}</li>
    {% endif %}

    <li class="edit-btn" {{ edy_intro_add_page }}>{% menuadd %}</li>
  {% endif %}
</ul>
