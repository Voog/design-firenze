{% if editmode %}
  <section class="lang-menu-wrap cfx">
    <button class="lang-btn flag {% for language in site.languages %}{% if language.selected? %}{{ language.code }}{% endif %}{% endfor %}"></button>
    <div class="lang-menu-popover" style="display: none;">
      <ul class="menu">
        {% for language in site.languages %}
          <li><a href="{{ language.url }}" class="flag {{ language.code }}{% if language.selected? %} active{% endif %}">{{ language.title }}</a></li>
        {% endfor %}
        <li class="centered">{% languageadd %}</li>
      </ul>
    </div>
  </section>
{% else %}
  {% if site.has_many_languages? %}
    <section class="lang-menu-wrap cfx">
      <button class="lang-btn flag {% for language in site.languages %}{% if language.selected? %}{{ language.code }}{% endif %}{% endfor %}"></button>
      <div class="lang-menu-popover" style="display: none;">
        <ul class="menu">
          {% for language in site.languages %}
            <li><a href="{{ language.url }}" class="flag {{ language.code }}{% if language.selected? %} active{% endif %}">{{ language.title }}</a></li>
          {% endfor %}
        </ul>
      </div>
    </section>
  {% endif %}
{% endif %}