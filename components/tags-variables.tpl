<!-- TODO: Add proper translations -->
<!-- Add languages in alphabetical order -->
{% capture dont_render %}
  {% case page.language_code %}
    <!-- Danish -->
    {% when 'da' %}
      {% assign tags_title = 'Filter indlæg' %}
      {% assign tags_all = 'Alle indlæg' %}
    <!-- German -->
    {% when 'de' %}
      {% assign tags_title = 'Beiträge filtern' %}
      {% assign tags_all = 'Alle Beiträge' %}
    <!-- Estonian -->
    {% when 'et' %}
      {% assign tags_title = 'Filtreeri postitusi' %}
      {% assign tags_all = 'Kõik postitused' %}
    <!-- Finnish -->
    {% when 'fi' %}
      {% assign tags_title = 'Suodatin viestiä' %}
      {% assign tags_all = 'kaikki viestit' %}
    <!-- Latvian -->
    {% when 'lv' %}
      {% assign tags_title = 'Filtru posts' %}
      {% assign tags_all = 'visas ziņas' %}
    <!-- Dutch -->
    {% when 'nl' %}
      {% assign tags_title = 'Filter berichten' %}
      {% assign tags_all = 'Alle berichten' %}
    <!-- Portuguese -->
    {% when 'pt' %}
      {% assign tags_title = 'Filtrar mensagens' %}
      {% assign tags_all = 'Todos os posts' %}
    <!-- Russian -->
    {% when 'ru' %}
      {% assign tags_title = 'Cообщений фильтра' %}
      {% assign tags_all = 'Все сообщения' %}
    <!-- Every other language -->
    {% else %}
      {% assign tags_title = 'Browse by tags' %}
      {% assign tags_all = 'All posts' %}
  {% endcase %}
{% endcapture %}
