-- 물고기 종류별 대어 찾기

select a.id as id, b.fish_name, a.length as length
from
fish_info a join fish_name_info b on a.fish_type = b.fish_type
where a.fish_type in (
select fish_type from fish_info
    group by fish_type
    having length = max(length)
)
order by id


-- 연도별 대장균 크기의 편차 구하기
select year(a.DIFFERENTIATION_DATE) as year, (b.max_size-a.size_of_colony) as year_dev, a.id
from ecoli_data a
left join (select year(DIFFERENTIATION_DATE) as year,max(size_of_colony) as max_size 
           from ecoli_data
           group by year(DIFFERENTIATION_DATE)) b
on year(a.DIFFERENTIATION_DATE) = b.year
order by year, year_dev
