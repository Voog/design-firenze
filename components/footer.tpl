<footer class="footer js-footer{% unless body_image == '' %} footer-gradient{% endunless %}">
  <div class="wrap">
    <div class="wrap-inner">
      <div class="content-formatted">{% xcontent name="footer" %}</div>
      <div class="voog-reference">{% loginblock %}{{ "footer_login_link" | lc }}{% endloginblock %}</div>
    </div>
  </div>
</footer>
