<!-- TODO: Add proper translations -->
<!-- Add languages in alphabetical order -->
{% case page.language_code %}
  {% when 'da' %}
    {% assign tags_title = 'Filter indlæg' %}
    {% assign tags_all = 'Alle indlæg' %}
  {% when 'de' %}
    {% assign tags_title = 'Beiträge filtern' %}
    {% assign tags_all = 'Alle Beiträge' %}
  {% when 'et' %}
    {% assign tags_title = 'Filtreeri postitusi' %}
    {% assign tags_all = 'Kõik postitused' %}
  {% when 'fi' %}
    {% assign tags_title = 'Suodatin viestiä' %}
    {% assign tags_all = 'kaikki viestit' %}
  {% when 'lv' %}
    {% assign tags_title = 'Filtru posts' %}
    {% assign tags_all = 'visas ziņas' %}
  {% when 'nl' %}
    {% assign tags_title = 'Filter berichten' %}
    {% assign tags_all = 'Alle berichten' %}
  {% when 'pt' %}
    {% assign tags_title = 'Filtrar mensagens' %}
    {% assign tags_all = 'Todos os posts' %}
  {% when 'ru' %}
    {% assign tags_title = 'Cообщений фильтра' %}
    {% assign tags_all = 'Все сообщения' %}
  {% else %}
    {% assign tags_title = 'Filter posts' %}
    {% assign tags_all = 'All posts' %}
{% endcase %}
