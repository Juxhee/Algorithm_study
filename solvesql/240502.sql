-- 레스토랑의 요일별 VIP
select max(total_bill) as total_bill, tip,sex,smoker,day,time,size  from tips
group by day



-- 배송 예정일 예측 성공과 실패

select date(order_purchase_timestamp) as purchase_date,
  count(case when order_estimated_delivery_date >= order_delivered_customer_date then order_id end) as success,
  count(case when order_estimated_delivery_date < order_delivered_customer_date then order_id end) as fail
from olist_orders_dataset
where date(order_purchase_timestamp) between '2017-01-01' and '2017-01-31'
group by date(order_purchase_timestamp)
order by purchase_date
