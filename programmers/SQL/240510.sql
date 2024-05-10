-- 업그레이드 할 수 없는 아이템 구하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/273712
SELECT B.ITEM_ID, A.ITEM_NAME, A.RARITY FROM ITEM_INFO A
JOIN ITEM_TREE B
ON A.ITEM_ID = B.ITEM_ID
WHERE B.ITEM_ID NOT IN 
(SELECT DISTINCT PARENT_ITEM_ID FROM ITEM_TREE WHERE PARENT_ITEM_ID IS NOT NULL)
ORDER BY B.ITEM_ID DESC


-- 특정 물고기를 잡은 총 수 구하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/298518
SELECT count(*) as FISH_COUNT FROM FISH_INFO A
JOIN FISH_NAME_INFO B
ON A.FISH_TYPE = B.FISH_TYPE
WHERE B.FISH_NAME IN ('BASS','SNAPPER')

-- 특정 조건을 만족하는 물고기별 수와 최대 길이 구하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/298519
-- ** IFNULL **
SELECT COUNT(*) AS FISH_COUNT, MAX(LENGTH) AS MAX_LENGTH, FISH_TYPE FROM FISH_INFO
GROUP BY FISH_TYPE
HAVING AVG(IFNULL(LENGTH,10)) >= 33
ORDER BY FISH_TYPE
