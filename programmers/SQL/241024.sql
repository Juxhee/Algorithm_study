-- 조건에 부합하는 중고거래 상태 조회하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/164672

-- 2022/10/5일에 등록된 중고거래 게시물의 
-- 게시글 ID, 작성자 ID, 게시글 제목, 가격, 거래상태 조회
-- 거래상태가 SALE -> 판매중, RESERVED -> 예약중, DONE -> 거래완료
-- 게시글 ID 내림차순

SELECT BOARD_ID, WRITER_ID, TITLE, PRICE, CASE WHEN STATUS = 'SALE' THEN '판매중'
                                            WHEN STATUS = 'RESERVED' THEN '예약중'
                                            WHEN STATUS = 'DONE' THEN '거래완료'
                                            END AS STATUS

FROM USED_GOODS_BOARD
WHERE CREATED_DATE = '2022-10-05'
ORDER BY BOARD_ID DESC

-- 조건에 맞는 사용자 정보 조회하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/164670
  
-- 중고 거래 게시물 3건 이상 등록한 사용자
-- 사용자 ID, 닉네임, 전체주소, 전화번호
-- 회원 ID 내림차순

SELECT A.USER_ID, A.NICKNAME, A.전체주소, A.전화번호  FROM
(SELECT USER_ID, NICKNAME, CONCAT(CITY,' ',STREET_ADDRESS1,' ',STREET_ADDRESS2) AS 전체주소,
CONCAT(SUBSTR(TLNO,1,3),'-',SUBSTR(TLNO,4,4),'-',SUBSTR(TLNO,8,4)) AS 전화번호
FROM USED_GOODS_USER) A 
JOIN USED_GOODS_BOARD B
ON A.USER_ID = B.WRITER_ID
GROUP BY A.USER_ID
HAVING COUNT(*) >= 3
ORDER BY A.USER_ID DESC
