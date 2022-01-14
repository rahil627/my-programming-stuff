# jekyll-snippets

# displays the value from the vars set in the config file
# in the config.yml:
# nav:
#   whatever: site.com
#   whatever: site2.com
#   ...
<div class="link-wrapper-mobile">
    {% if site.nav %}
        {% for link in site.nav %}
           {{ link[1] }}
           <span style="margin-left: 5px;"></span>
        {% endfor %}
    {% endif %}
</div>
