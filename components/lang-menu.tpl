<ul class="menu nav-menu">
  {% for language in site.languages %}
    <li{% if language.selected? %} class="active"{% endif %}><a href="{{ language.url }}" class="lang-flag {{ language.code }}">{{ language.title }}</a></li>
  {% endfor %}
  {% if editmode %}<li class="add-lang-btn">{% languageadd %}</li>{% endif %}
</ul>
