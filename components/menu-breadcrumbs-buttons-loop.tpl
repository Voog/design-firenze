{% for item in menu_items %}
  {% if item.selected? %}
    {% if item.current? and editmode %}
      {% if item.untranslated_children.size > 0 %}
        <li class="menu-item menu-item-cms">{% menubtn item.untranslated_children %}</li>
      {% endif %}

      {% if item.hidden_children.size > 0 %}
        <li class="menu-item menu-item-cms">{% menubtn item.hidden_children %}</li>
      {% endif %}

      {% unless item.layout_title == product_layout %}
        <li class="menu-item menu-item-cms">{% menuadd parent="item" %}</li>
      {% endunless %}
    {% endif %}
  {% endif %}

  {% if item.visible_children.size > 0 %}
    {% include "menu-breadcrumbs-buttons-loop" menu_items: item.visible_children  %}
  {% endif %}
{% endfor %}
