{%- if editmode -%}
  <div class="layout_settings-popover js-layout_settings-popover">
    {% include "settings-editor" %}
    {%- if _blogPage == true -%}
      {% include 'settings-blog-page' %}
      {% include "edicy-tools" %}
    {%- endif -%}
    {%- if _articlePage == true -%}
      {% include 'settings-article-page' %}
      {% include "edicy-tools" with "article" %}
    {%- endif -%}
    <div class="layout_settings-arrow"></div>
  </div>

  <div class="js-layout_settings-btn js-prevent-sideclick d-none">
    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
      <g clip-path="url(#clip0)">
        <path d="M10.707 3.22198L3.63596 10.293C3.21533 10.7137 3.02123 11.2751 3.05366 11.8256C3.05742 11.8895 3.06175 11.9517 3.0673 12.0124C3.0673 12.0288 16.0424 12.0288 16.0424 12.0288C16.3665 11.7046 16.9451 11.126 17.7781 10.293L10.707 3.22198ZM12.1212 1.80777L19.1923 8.87884C19.9734 9.65988 19.9734 10.9262 19.1923 11.7073L12.1212 18.7783C10.5591 20.3404 8.02649 20.3404 6.46439 18.7783L2.22175 14.5357C0.659653 12.9736 0.659653 10.4409 2.22175 8.87884L9.29282 1.80777C10.0739 1.02672 11.3402 1.02672 12.1212 1.80777Z" fill="black"/>
        <path opacity="0.3" fill-rule="evenodd" clip-rule="evenodd" d="M20 22C21.6569 22 23 20.6569 23 19C23 17.8954 22 16.2288 20 14C18 16.2288 17 17.8954 17 19C17 20.6569 18.3431 22 20 22Z" fill="black"/>
      </g>
      <defs>
        <clipPath id="clip0">
          <rect width="24" height="24" fill="white"/>
        </clipPath>
      </defs>
    </svg>
  </div>
{%- endif -%}
