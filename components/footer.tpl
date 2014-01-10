{% unless site.root_item.selected? %}
  <footer class="footer-wrap cp-footer-wrap">{% xcontent name="footer" %}</footer>
{% else %}
  <footer class="footer-wrap {% if site.root_item.selected? %}fp{% else %}cp{% endif %}-footer">
      <section class="fp-footer-content">
        {% xcontent name="footer" %}
      </section>
  </footer>
{% endunless %}