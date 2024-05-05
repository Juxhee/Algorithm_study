
-- 노선별 평균 역 사이 거리 조회하기
select ROUTE, concat(ROUND(sum(d_between_dist),1),'km') as TOTAL_DISTANCE, concat(ROUND(avg(d_between_dist),2),'km') as AVERAGE_DISTANCE
from subway_distance
group by route
-- 포인트
order by ROUND(sum(d_between_dist),1) desc


-- 조건에 맞는 사원 정보 조회하기
SELECT SUM(C.SCORE) as SCORE, B.EMP_NO, B.EMP_NAME, B.POSITION, B.EMAIL
FROM HR_DEPARTMENT A
JOIN HR_EMPLOYEES B
ON A.DEPT_ID = B.DEPT_ID
JOIN HR_GRADE C
ON B.EMP_NO = C.EMP_NO
WHERE C.YEAR = '2022'
GROUP BY C.EMP_NO
ORDER BY SCORE desc
LIMIT 1


-- 월별 잡은 물고기 수 구하기
SELECT COUNT(*) as FISH_COUNT, MONTH(TIME) as MONTH
FROM FISH_INFO
GROUP BY MONTH(TIME)
HAVING (COUNT(TIME) != 0)
ORDER BY MONTH
