<ul class="menu nav-menu">
    <li {% if site.root_item.selected? %} class="active"{% endif %}><a href="{{ site.root_item.url }}">{{ site.root_item.title }}</a></li>
    {% for item in site.visible_menuitems %}
      <li{% if item.selected? %} class="active"{% endif %}><a{% unless item.translated? %} class="untranslated fci-editor-menuadd"{% endunless %} href="{{ item.url }}">{{ item.title }}</a></li>
    {% endfor %}
    {% if editmode %}
      {% if site.hidden_menuitems.size > 0 %}
        <li>{% menubtn site.hidden_menuitems %}</li>
      {% endif %}
      {% if editmode %}<li class="add-page-btn">{% menuadd %}</li>{% endif %}
    {% endif %}
</ul>
