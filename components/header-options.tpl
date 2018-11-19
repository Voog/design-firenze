<div class="header-options js-background-type {{ body_bg_type }}">
  {% if site.search.enabled %}
    <button class="search-btn search-open-btn js-search-open-btn">
      <svg width="16px" height="16px" viewBox="0 0 16 16"  xmlns="http://www.w3.org/2000/svg">
        <path d="M15.323,13.712 C15.323,14.194 15.135,14.647 14.794,14.988 C14.453,15.328 14,15.516 13.519,15.516 C13.037,15.516 12.584,15.328 12.243,14.988 C12.243,14.988 9.136,11.881 9.136,11.881 C8.279,12.318 7.323,12.588 6.294,12.588 C2.818,12.588 0,9.77 0,6.294 C0,2.818 2.818,0 6.294,0 C9.77,0 12.588,2.818 12.588,6.294 C12.588,7.424 12.266,8.47 11.745,9.387 C11.745,9.387 14.794,12.437 14.794,12.437 C15.135,12.777 15.323,13.23 15.323,13.712 ZM6.295,1.516 C3.655,1.516 1.514,3.656 1.514,6.297 C1.514,8.937 3.655,11.078 6.295,11.078 C8.936,11.078 11.076,8.937 11.076,6.297 C11.076,3.656 8.936,1.516 6.295,1.516 Z "></path>
      </svg>
    </button>

    <button class="search-btn search-close-btn js-search-close-btn">
      <svg width="16px" height="16px" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg">
        <path d="M15.205,2.743 C15.205,2.743 10.03,7.918 10.03,7.918 C10.03,7.918 15.109,12.997 15.109,12.997 C15.695,13.583 15.694,14.533 15.109,15.118 C14.523,15.704 13.574,15.704 12.988,15.118 C12.988,15.118 7.909,10.039 7.909,10.039 C7.909,10.039 2.743,15.205 2.743,15.205 C2.149,15.799 1.187,15.799 0.594,15.205 C0,14.612 0,13.65 0.594,13.056 C0.594,13.056 5.759,7.89 5.759,7.89 C5.759,7.89 0.674,2.805 0.674,2.805 C0.088,2.218 0.088,1.269 0.674,0.683 C1.259,0.098 2.209,0.097 2.795,0.683 C2.795,0.683 7.881,5.769 7.881,5.769 C7.881,5.769 13.055,0.594 13.055,0.594 C13.649,0 14.611,0.001 15.205,0.594 C15.798,1.188 15.799,2.149 15.205,2.743 Z "></path>
      </svg>
    </button>
  {% endif %}

  {% if editmode or site.has_many_languages? %}
    <nav class="menu-lang">
      <button class="menu-lang-btn lang-flag lang-flag-{{ page.language_code }} js-menu-lang-btn js-btn" data-lang-code="{{ page.language_locale }}" {{ edy_intro_add_lang }}>
        {% if editmode or flags_state == false %}
          <span class="lang-title">
            {% for language in site.languages %}{% if language.selected? %}{{ language.title }}{% endif %}{% endfor %}
            <span class="ico-popover-toggle">▼</span>
          </span>
        {% endif %}
      </button>
      <div class="menu-lang-popover js-menu-lang js-popover">
        {% include "menu-lang" %}
      </div>
    </nav>
  {% endif %}
</div>
