{% comment %}<!-- SITE WIDE JAVASCRIPTS -->{% endcomment %}
<script src="{{ javascripts_path }}/jquery.js?6"></script>
<script src="{{ javascripts_path }}/main.js?6"></script>
<script src="{{ javascripts_path }}/backstretch.js?6"></script>
<script src="{{ javascripts_path }}/overthrow.js?6"></script>
<script src="{{ site.static_asset_host }}/libs/picturefill/1.0.0/picturefill.min.js?6"></script>

{% if site.search.enabled %}
  <!-- TODO: Replace script URL if newer version is added to voog.construction -->
  <!-- <script src="{{ site.static_asset_host }}/libs/edicy-search/1.0.0/edicy-search.js?6"></script> -->
  <script src="{{ javascripts_path }}/edicy-search-test.js?6"></script>
  <script type="text/javascript">
    var search = new VoogSearch($('.js-search-form').get(0), {
      per_page: 3,
      lang: '{{ page.language_code }}',
      resultsContainer: $('.js-voog-search-modal').get(0), // if given an element results are rendered inside that element instead of modal (with scroll lazy load support)
      sideclick: true, // if modal should close on sideclick
      mobileModeWidth: 480, // mobile checkpoint (adds class "voog-search-mobile-mode" if <=)
      updateOnKeypress: false // updates results on every keypress
    });
  </script>
{% endif %}

{% comment %}<!-- GOOGLE ANALYTICS INITIATION -->{% endcomment %}
{% unless editmode %}{{ site.analytics }}{% endunless %}
