<div class="tags">
  {% if editmode %}
    {% editable article.tags %}
  {% else %}
    <nav class="tags-menu">
      <ul class="menu">
        <li><a href="/{{ site.blogs.first.page.path }}">{% case page.language_code %}{% when 'et' %}Kõik teemad {% else %}All topics{% endcase %}</a></li>
        {% for tag in article.tags %}
          <li><a href="/{{ site.blogs.first.page.path }}/tagged/{{ tag.path }}">, {{ tag.name }}</a></li>
        {% endfor %}
      </ul>
    </nav>
  {% endif %}
</div>
