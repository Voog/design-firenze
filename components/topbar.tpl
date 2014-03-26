<aside class="topbar js-topbar">
  <div class="topbar-inner">
    <nav class="main-menu">
      {% include "nav-menu" %}
    </nav>
    {% if page.blog? == true %}
      {% if site.has_language_tags? %}
        <section class="tags">
          <button class="tags-btn js-tags-btn">Browse by tags</button>
          <nav class="tags-menu js-tags-menu">
            <ul class="menu nav-menu">
              <li class="blog-main"><a href="/{{ site.blogs.first.page.path }}">{% case page.language_code %}{% when 'et' %}Kõik teemad{% else %}All topics{% endcase %}</a></li>
              {% for tag in site.language_tags %}
                {% assign activestr = " " %}
                {% for tmptag in tags %}
                  {% if tmptag.name == tag.name %}
                    {% assign activestr = " class='active'" %}
                  {% endif %}
                {% endfor %}
                <li {{ activestr }}><a  href="/{{ site.blogs.first.page.path }}/tagged/{{ tag.path }}">{{ tag.name }}</a></li>
              {% endfor %}
            </ul>
          </nav>
        </section>
      {% endif %}
    {% endif %}
  </div>
</aside>
