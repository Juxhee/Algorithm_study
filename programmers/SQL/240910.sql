-- 월별 잡은 물고기 수 구하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/293260

-- group by, 날짜 포맷팅
-- 월별 잡은 물고기의 수와 월을 출력
-- 월 기준 오름차순

-- point
-- GROUP BY 된 행의 조건을 입력할 때는 HAVING
-- MONTH(DATE)

SELECT COUNT(*) AS FISH_COUNT, MONTH(TIME) AS MONTH FROM FISH_INFO
GROUP BY MONTH(TIME)
HAVING FISH_COUNT > 0
ORDER BY MONTH


-- 대여 횟수가 많은 자동차들의 월별 대여 횟수 구하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/151139

-- group by, 날짜 포맷팅, 서브쿼리
-- 대여 시작일 2022-08 과 2022-10 사이
-- 총 대여 횟수가 5회 이상
-- 월별 자동차 ID 별 총 대여 횟수

-- point
-- 총 대여 횟수가 5회 이상인 데이터들을 선택해야 하므로 서브쿼리를 활용해서 조건을 추가해준다. 메인쿼리는 group by 기준이 car_id 랑 month이고, 서브쿼리는 car_id 만 기준으로 대여 횟수를 뽑아내야 하기 때문!
-- 날짜 포맷은 DATE_FORMAT(컬럼명, '%Y-%m') 과 같은 형태로도 할 수 있다

SELECT MONTH(START_DATE) AS MONTH, CAR_ID, COUNT(*) AS RECORDS FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
WHERE START_DATE >= '2022-08-01' and START_DATE < '2022-11-01' 
    AND CAR_ID IN (SELECT CAR_ID FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
                  WHERE DATE_FORMAT(START_DATE, '%Y-%m') BETWEEN '2022-08' AND
                  '2022-10'
                  GROUP BY CAR_ID
                  HAVING COUNT(CAR_ID) >=5)
GROUP BY CAR_ID, MONTH(START_DATE)
HAVING RECORDS >= 1
ORDER BY MONTH, CAR_ID DESC


/* 

서브 쿼리
- 내부 쿼리의 결과를 기반으로 데이터를 필터링, 검색 또는 조작하는 데 자주 사용되는 다른 쿼리 내에 포함된 쿼리로 SELECT, FROM, WHERE, HAVING 과 같은 다양한 부분에서 활용 가능

참고자료
https://easyitwanner.tistory.com/274

*/
