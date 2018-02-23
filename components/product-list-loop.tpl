{% for item in menu_items %}
  {% if item.current? %}
    {% for item_child in item.visible_children_with_data %}
      {% if item_child.layout_title == product_list_layout or item_child.layout_title == product_layout %}
        {% include "product-list-item" menu_level: item_child %}
      {% endif %}
    {% endfor %}
  {% endif %}

  {% if item.children_with_hidden.size > 0 %}
    {% include "product-list-loop" menu_items: item.children_with_hidden  %}
  {% endif %}
{% endfor %}
