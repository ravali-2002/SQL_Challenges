-- sol2 : using inner join
with cte1 as(
select product,count(product) c  from tbl group by product ),
cte2 as
(select product,vendor from tbl group by product,vendor),
cte3 as(
select c2.* from cte1 c1 inner join cte2 c2
on c1.product=c2.product where c=1)
select vendor,count(vendor) non_exclusive_products_cnt from cte3 group by vendor
