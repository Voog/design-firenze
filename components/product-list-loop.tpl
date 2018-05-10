{% for i in (1..4) %}
  {% assign level_str = 'menuitems_on_level_' | append: i %}
  {% for item in site[level_str] %}
    {% if item.current? %}
      {% for item_child in item.visible_children_with_data %}
        {% if item_child.layout_title == product_list_layout or item_child.layout_title == product_layout %}
          {% include "product-list-item" menu_level: item_child %}
        {% endif %}
      {% endfor %}
    {% endif %}
  {% endfor %}
{% endfor %}
