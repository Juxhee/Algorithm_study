-- https://school.programmers.co.kr/learn/courses/30/lessons/59043
-- 있었는데요 없었습니다

-- 보호 시작일보다 입양일이 더 빠른 동물의 아이디와 이름을 조회
-- 아이디, 이름
-- 정렬: 보호 시작일 빠른 순 


SELECT A.ANIMAL_ID, A.NAME FROM ANIMAL_INS A
INNER JOIN ANIMAL_OUTS B
ON A.ANIMAL_ID = B.ANIMAL_ID
WHERE A.DATETIME > B.DATETIME
ORDER BY A.DATETIME 


-- https://school.programmers.co.kr/learn/courses/30/lessons/131124
-- 그룹별 조건에 맞는 식당 목록 출력하기

-- 고객 정보 MEMBER_PROFILE, 리뷰 정보 REST_REVIEW
-- 리뷰를 가장 많이 작성한 회원의 리뷰를 조회
-- 회원 이름, 리뷰 텍스트, 리뷰 작성일
-- 정렬: 리뷰 작성일(오름), 리뷰 텍스트(오름)
-- 날짜 포맷 맞출 것

-- point
-- 서브 쿼리 및 최댓값 하나 뽑아낼때 ORDER BY DESC LIMIT 1

SELECT A.MEMBER_NAME, B.REVIEW_TEXT AS REVEIW_TEXT, DATE_FORMAT(B.REVIEW_DATE, '%Y-%m-%d') AS REVIEW_DATE FROM MEMBER_PROFILE A
JOIN REST_REVIEW B
ON A.MEMBER_ID = B.MEMBER_ID
WHERE B.MEMBER_ID = (SELECT MEMBER_ID
                      FROM REST_REVIEW 
                      GROUP BY MEMBER_ID
                      ORDER BY COUNT(*) DESC
                      LIMIT 1
                      )
                      
ORDER BY REVIEW_DATE, REVIEW_TEXT
