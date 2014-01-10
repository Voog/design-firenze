<header class="cp-header cfx">
  <h1 class="header-logo">
    {% unless editmode %}<a href="{{site.root_item.url}}">{% endunless %}
      {% editable site.header %}
    {% unless editmode %}</a>{% endunless %}
  </h1>
  {% include "main-menu" %}
  {% include "lang-menu" %}
  <section class="mobile-menu-btn-wrap">
    <div class="mobile-menu-stripe"></div>
    <div class="mobile-menu-stripe"></div>
    <div class="mobile-menu-stripe"></div>
  </section>
</header>