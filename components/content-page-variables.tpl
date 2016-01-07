{% capture site_header_html %}{% unless editmode %}{% editable site.header %}{% endunless %}{% endcapture %}
{% capture site_header_size %}{{ site_header_html | size | minus : 1 }}{% endcapture %}
{% unless site_header_size contains "-" %}
  {% assign site_header_has_content = true %}
{% else %}
  {% assign site_header_has_content = false %}
{% endunless %}
