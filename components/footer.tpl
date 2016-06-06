<footer class="footer js-footer js-background-type {{ body_bg_type }}{% unless body_bg_image == '' %} footer-gradient{% endunless %}">
  <div class="footer-inner js-footer-inner">
    <div class="content-formatted">{% xcontent name="footer" %}</div>
    {% if site.branding.enabled %}
      <div class="voog-reference">{% loginblock %}Voog{% endloginblock %}</div>
    {% endif %}
  </div>
</footer>
