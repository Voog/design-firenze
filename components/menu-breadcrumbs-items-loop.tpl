{% for i in (1..5) %}
  {% assign level_str = 'menuitems_with_hidden_on_level_' | append: i %}
  {% for item in site[level_str] %}

    {% if site.root_item.layout_title == product_list_layout %}
      {% assign page_Lvl = 0 %}
    {% else %}
      {% assign page_Lvl = 1 %}
    {% endif %}

    {% if item.selected? and page.level > page_Lvl %}
      <span class="menu-separator">/</span>

      {% menulink item wrapper-tag="li" wrapper-class="menu-item" %}
    {% endif %}
  {% endfor %}
{% endfor %}
