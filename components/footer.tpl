<footer class="footer js-footer js-background-type {{ body_bg_type }}{% unless body_bg_image == '' %} footer-gradient{% endunless %}">
  <div class="footer-inner js-footer-inner">
    {%- assign footer_content_title = "footer" | lce -%}
    {%- assign footer_content_title_tooltip = "content_tooltip_all_pages_same_language" | lce -%}
    <div class="content-formatted">{% xcontent name="footer" title=footer_content_title title_tooltip=footer_content_title_tooltip %}</div>
    {% if site.branding.enabled %}
      <div class="voog-reference">{% loginblock %}Voog{% endloginblock %}</div>
    {% endif %}
    {% if page.private? %}
      <div class="signout-btn-margin"></div>
    {% endif %}
  </div>
</footer>
