-- sol : 1 using window functions
with cte1 as(
select product,vendor, row_number() over(partition by product order by product) r from tbl),
cte2 as (
select *, count(r) over(partition by product order by product) c from cte1)
select vendor, sum(c) non_exclusive_products_cnt from cte2 where c=1
group by vendor
