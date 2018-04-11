{% for item in menu_items %}

  {% if site.root_item.layout_title == product_list_layout %}
    {% assign page_Lvl = 0 %}
  {% else %}
    {% assign page_Lvl = 1 %}
  {% endif %}

  {% if item.selected? and page.level > page_Lvl %}
    <span class="menu-separator">/</span>
    {% menulink item wrapper-tag="li" wrapper-class="menu-item" %}
  {% endif %}

  {% if item.children_with_hidden.size > 0 %}
    {% include "menu-breadcrumbs-items-loop" menu_items: item.children_with_hidden  %}
  {% endif %}
{% endfor %}
