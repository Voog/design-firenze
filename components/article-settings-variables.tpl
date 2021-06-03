{%- assign articleSettingsData = article.data.article_settings -%}

{% assign article_data_show_date_defined = false %}
{% if article.data.article_settings.show_date == true or article.data.article_settings.show_date == false %}
  {% assign show_article_date = article.data.article_settings.show_date %}
  {% assign article_data_show_date_defined = true %}
{% elsif site.data.article_settings.show_dates == false %}
  {% assign show_article_date = false %}
{% else %}
  {% assign show_article_date = true %}
{% endif %}

{% if article.data.article_settings.show_comments == true or article.data.article_settings.show_comments == false %}
  {% assign show_article_comments = article.data.article_settings.show_comments %}
{% elsif site.data.article_settings.show_comments == false %}
  {% assign show_article_comments = false %}
{% else %}
  {% assign show_article_comments = true %}
{% endif %}
