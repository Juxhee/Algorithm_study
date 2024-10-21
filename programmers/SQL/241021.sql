-- 저자 별 카테고리 별 매출액 집계하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/144856
-- 저자별, 카테고리별 매출액 계산 (판매량*판매가)
-- 2022년 1월 저자 ID, 저자명, 카테고리, 매출액 출력
-- 저자 ID 기준 오름차순, 카테고리 내림차순
-- Group by 여러개 가능하군,,


SELECT A.AUTHOR_ID, A.AUTHOR_NAME, B.CATEGORY, SUM((BS.SALES * B.PRICE)) AS TOTAL_SALES
FROM BOOK B
JOIN AUTHOR A ON A.AUTHOR_ID = B.AUTHOR_ID
JOIN BOOK_SALES BS ON B.BOOK_ID = BS.BOOK_ID
WHERE BS.SALES_DATE BETWEEN '2022-01-01' and '2022-01-31'
GROUP BY B.CATEGORY, A.AUTHOR_NAME
ORDER BY 1,3 DESC
