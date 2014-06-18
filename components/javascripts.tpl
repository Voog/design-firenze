{% comment %}<!-- SITE WIDE JAVASCRIPTS -->{% endcomment %}
<script src="{{ javascripts_path }}/jquery.js?5"></script>
<script src="{{ javascripts_path }}/main.js?5"></script>
<script src="{{ javascripts_path }}/backstretch.js?5"></script>
<script src="{{ javascripts_path }}/overthrow.js?5"></script>

{% comment %}
{% if site.search.enabled %}
<script src="http://static.voog.com/libs/edicy-search/1.0.0/edicy-search.js"></script>
<script>

  $(function() {
    var search = new VoogSearch($('.js-search-form'), {
      per_page: 3,
      lang: '{{ page.language_code }}',
      noResults: '{{ "search_noresults"|lc }}',
      minChars: 2
    });
  });
</script>
{% endif %}
{% endcomment %}

{% comment %}<!-- GOOGLE ANALYTICS INITIATION -->{% endcomment %}
{% unless editmode %}{{ site.analytics }}{% endunless %}
