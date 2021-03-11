{% for i in (1..5) %}
  {% assign level_str = 'menuitems_on_level_' | append: i %}
  {% for item in site[level_str] %}
  {% if item.selected? %}
    {% if item.current? and editmode %}
      {% if item.untranslated_children.size > 0 %}
        <li class="menu-item menu-item-cms">{% menubtn item.untranslated_children %}</li>
      {% endif %}

      {% if item.hidden_children.size > 0 %}
        <li class="menu-item menu-item-cms">{% menubtn item.hidden_children %}</li>
      {% endif %}

      {% unless item.layout_title == product_layout %}
        <li class="menu-item menu-item-cms">
          {% assign add_product_label = 'add_product' | lce %}
          {% assign add_product_title = 'add_product_page' | lce %}
          {% if item.layout_title == product_list_layout %}
            {% menuadd parent=item label=add_product_label lable=add_product_title layout_title="Product" %}
          {% else %}
            {% menuadd parent=item %}</li>
          {% endif %}
      {% endunless %}
    {% endif %}
  {% endif %}
{% endfor %}
{% endfor %}
