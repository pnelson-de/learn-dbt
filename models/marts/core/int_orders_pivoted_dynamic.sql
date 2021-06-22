{%- set payment_methods = get_payment_methods() -%}

with payments as (
    SELECT * FROM {{ ref('stg_payments') }}
),
final as (
    SELECT order_id,
    {% for payment_method in payment_methods -%}
    SUM(CASE WHEN payment_method = '{{ payment_method }}' THEN ROUND(AMOUNT,2) ELSE 0.00 END) AS {{ payment_method }}_amount
    {%- if not loop.last %} , {% endif %}
    {% endfor -%}
    FROM {{ ref('stg_payments') }}
    GROUP BY order_id
)
SELECT * FROM final