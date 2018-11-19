<ul class="menu">
  {% for language in site.languages %}
    <li class="menu-item">
      <a class="menu-link lang-flag lang-flag-{{ language.code }}{% if language.selected? %} active{% endif %}" href="{{ language.url }}" data-lang-code="{{ language.locale }}">{{ language.title }}</a>
    </li>
  {% endfor %}
  {% if editmode %}<li class="edit-btn">{% languageadd %}</li>{% endif %}
</ul>

{% if editmode %}
  <div class="lang-options">
    <ul class="menu">
      <li class="menu-item">
        <button class="option-btn js-option-toggle-flags{% if flags_state %} js-flag-disable-btn{% endif %}">
          <span class="disable-text">{{ "disable_lang_flags" | lc: editor_locale }}</span>
          <span class="enable-text">{{ "enable_lang_flags" | lc: editor_locale }}</span>
        </button>
      </li>
    </ul>
  </div>
{% endif %}
