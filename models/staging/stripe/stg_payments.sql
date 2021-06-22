SELECT orderid as order_id,
       paymentmethod as payment_method,
       status as payment_status,
       {{ cents_to_dollars('amount') }} as amount,
       created
FROM {{ source('stripe', 'payment')}}
--{{ limit_dev_data('created', 10000) }}
