{% macro limit_dev_data(column, days=3) %}
{%- if target.name == 'dev' -%}
WHERE {{ column }} >= dateadd('day', -{{ days }}, current_timestamp)
{%- endif %}
{% endmacro%}