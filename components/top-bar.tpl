<aside class="top-bar">
  <section class="top-bar-inner">
    <nav class="main-menu {% if site.root_item.selected? %}fp{% else %}cp{% endif %}-main-menu{% if page.blog? %} blog-menu{% endif %} cfx">
      <ul class="menu horz-menu cfx">
        {% unless site.root_item.hidden? %}
          <li>
            <a href="{{site.root_item.url}}" {% if site.root_item.selected? %} class="active"{% endif %}>{{site.root_item.title}}</a>
          </li>
        {% endunless %}
        {% for item in site.visible_menuitems %}
          <li><a href="{{ item.url }}" {% if item.selected? %} class="active"{% endif %}{% unless item.translated? %} class="untranslated fci-editor-menuadd"{% endunless %}>{{ item.title }}</a></li>  
        {% endfor %}
        {% if editmode %}
          <li>{% menubtn site.hidden_menuitems %}</li>
          <li>{% menuadd %}</li>
       {% endif %}
      </ul>
    </nav>
    {% if page.blog? == true %}
      {% if site.has_language_tags? %}
        <section class="post-tags">
          <button class="top-bar-btn">Browse by tags</button>
        </section>
        <nav class="tags-menu">
          <ul class="menu vert-menu">
            <li class="blog-main"><a href="/{{ site.blogs.first.page.path }}">{% case page.language_code %}{% when 'et' %}Kõik teemad{% else %}All topics{% endcase %}</a></li>
            {% for tag in site.language_tags %}
              {% assign activestr = " " %}
              {% for tmptag in tags %}
                {% if tmptag.name == tag.name %}
                  {% assign activestr = " class='active'" %}
                {% endif %}
              {% endfor %}
              <li><a {{ activestr }} href="/{{ site.blogs.first.page.path }}/tagged/{{ tag.path }}">{{ tag.name }}</a></li>
            {% endfor %}
          </ul>
        </nav>
      {% endif %}
    {% endif %}
  </section>
</aside>