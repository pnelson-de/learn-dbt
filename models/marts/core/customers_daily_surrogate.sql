SELECT 
    {{ dbt_utils.surrogate_key(['customer_id', 'order_id']) }} as surrogate_key,
    customer_id, 
    order_date, 
    count(*) as count_of_orders
FROM {{ ref('stg_customers')}}
JOIN {{ ref('stg_orders') }} USING (customer_id)
GROUP BY 1,2,3