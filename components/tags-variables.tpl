<!-- TODO: Add proper translations -->
<!-- Add languages in alphabetical order -->
{% capture dont_render %}
  {% case page.language_code %}
    <!-- Danish -->
    {% when 'da' %}
      {% assign tags_button = 'Filter indlæg' %}
      {% assign tags_post_title = 'Tags' %}
      {% assign tags_all = 'Alle indlæg' %}
    <!-- German -->
    {% when 'de' %}
      {% assign tags_button = 'Beiträge filtern' %}
      {% assign tags_post_title = 'Schlagworte' %}
      {% assign tags_all = 'Alle Beiträge' %}
    <!-- Estonian -->
    {% when 'et' %}
      {% assign tags_button = 'Filtreeri postitusi' %}
      {% assign tags_post_title = 'Sildid' %}
      {% assign tags_all = 'Kõik postitused' %}
    <!-- Finnish -->
    {% when 'fi' %}
      {% assign tags_button = 'Suodatin viestiä' %}
      {% assign tags_post_title = 'Tunnisteet' %}
      {% assign tags_all = 'kaikki viestit' %}
    <!-- Latvian -->
    {% when 'lv' %}
      {% assign tags_button = 'Filtru posts' %}
      {% assign tags_post_title = 'Tags' %}
      {% assign tags_all = 'visas ziņas' %}
    <!-- Dutch -->
    {% when 'nl' %}
      {% assign tags_button = 'Filter berichten' %}
      {% assign tags_post_title = 'Žymos' %}
      {% assign tags_all = 'Alle berichten' %}
    <!-- Portuguese -->
    {% when 'pt' %}
      {% assign tags_button = 'Filtrar mensagens' %}
      {% assign tags_post_title = 'Marcações' %}
      {% assign tags_all = 'Todos os posts' %}
    <!-- Russian -->
    {% when 'ru' %}
      {% assign tags_button = 'Cообщений фильтра' %}
      {% assign tags_post_title = 'Метки' %}
      {% assign tags_all = 'Все сообщения' %}
    <!-- Every other language -->
    {% else %}
      {% assign tags_button = 'Browse by tags' %}
      {% assign tags_post_title = 'Tags' %}
      {% assign tags_all = 'All posts' %}
  {% endcase %}
{% endcapture %}
