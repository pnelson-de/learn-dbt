SELECT order_id, sum(amount) as total_amount
FROM {{ ref('stg_payments') }}
GROUP BY 1
HAVING total_amount < 0