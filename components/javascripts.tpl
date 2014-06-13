{% comment %}<!-- SITE WIDE JAVASCRIPTS -->{% endcomment %}
<script src="{{ javascripts_path }}/jquery.js?5"></script>
<script src="{{ javascripts_path }}/main.js?5"></script>
<script src="{{ javascripts_path }}/backstretch.js?5"></script>
<script src="{{ javascripts_path }}/overthrow.js?5"></script>
<script src="{{ javascripts_path }}/search.js?5"></script>

<script>
  var search = new VoogSearch($('.js-search-form').get(0), {
    per_page: 2,
    lang: '{{ page.language_code }}'
  });
</script>

{% comment %}<!-- GOOGLE ANALYTICS INITIATION -->{% endcomment %}
{% unless editmode %}{{ site.analytics }}{% endunless %}
