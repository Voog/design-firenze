<script src="{{ javascripts_path }}/jquery.js?3"></script>
<script src="{{ javascripts_path }}/main.js?3"></script>
<script src="{{ javascripts_path }}/retina.js?3"></script>
<script src="{{ javascripts_path }}/overthrow.js?3"></script>

{% if site.search.enabled %}
  <script src="http://static.edicy.com/assets/site_search/3.0/site_search.js?3"></script>
  <script>
    var edys_site_search_options = {
      texts: { noresults: "{{ "search_noresults" | lc }}" },
      default_stylesheet_enabled: false
    }
  </script>
{% endif %}

{% unless editmode %}{{ site.analytics }}{% endunless %}
