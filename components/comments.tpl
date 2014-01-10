<section id="comments-area" class="comments-wrap">
  <h1 class="comments-title">{% case article.comments_count %}{% when 0 %}{{"no_comments"|lc}}{% else %}{{"comments_for_count" | lc}}: <span class="edy-site-blog-comments-count">{{article.comments_count}}</span>{% endcase %}</h1>
  
  {% for comment in article.comments %}
    <article class="comment-content">
      <div class="comment">
        <span class="comment-body">{{ comment.body }}</span>
        <span class="comment-info">
          <span class="comment-author">{{ comment.author }}, </span>
          <time datetime="2013-06-12" class="comment-date">({{ comment.created_at | date : "%b %d, %Y" }})</time>
        </span>
      </div>
    </article>
  {% endfor %}
  
  <div id="add-comment-wrap"{% unless comment.valid? %} class="form_with_errors"{% endunless %}>
    <h2 class="comment-title">{{"add_a_comment"|lc}}</h2>
    {% commentform %}
      <div class="form_area">
        <div class="form_fields">
          <div class="form_field{% unless comment.valid? %} form_field_with_errors{% endunless %}">
            <label for="commentform-name">
              {{ "name" | lc }}
              {% unless comment.valid? %}
                <span class="form_field_error">
                  {% for error in comment.errors %}
                    {% if forloop.index == 1 %}
                      - {{ error | lc }}
                    {% endif %}
                  {% endfor %}
                </span>
              {% endunless %}
            </label>
            <input type="text" class="form_field_textfield form_field_size_small" id="commentform-name" value="{{ comment.author }}" name="comment[author]">
          </div>
          <div class="form_field{% unless comment.valid? %} form_field_with_errors{% endunless %}">
            <label for="commentform-email">
              {{ "email" | lc }}
              {% unless comment.valid? %}
                <span class="form_field_error">
                  {% for error in comment.errors %}
                    {% if forloop.index == 2 %}
                      - {{ error | lc }}
                    {% endif %}
                  {% endfor %}
                </span>
              {% endunless %}
            </label>
            <input type="text" class="form_field_textfield form_field_size_small" id="commentform-email" value="{{ comment.author_email }}" name="comment[author_email]">
          </div>
          <div class="form_field{% unless comment.valid? %} form_field_with_errors{% endunless %}">
            <label for="commentform-body">
              {{ "comment" | lc }}
              {% unless comment.valid? %}
                <span class="form_field_error">
                  {% for error in comment.errors %}
                    {% if forloop.index == 3 %}
                      - {{ error | lc }}
                    {% endif %}
                  {% endfor %}
                </span>
              {% endunless %}
            </label>
            <textarea class="form_field_textarea form_field_size_medium" id="commentform-body" name="comment[body]">{{ comment.body }}</textarea>
          </div>
        </div>
        <div class="form_submit">
          <input type="submit" value="{{ "submit" | lc }}">
        </div>
      </div>
    {% endcommentform %}
  </div>
</section>