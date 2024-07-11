-- 물고기 종류 별 잡은 수 구하기

-- FISH_INFO -> 물고기 정보
-- FISH_NAME_INFO -> 물고기 이름 정보

-- 물고기 종류(FISH_TYPE) 별 물고기 이름(FISH_NAME)과 잡은 수

SELECT A.FISH_COUNT,B.FISH_NAME
FROM 
(SELECT FISH_TYPE, COUNT(FISH_TYPE) as FISH_COUNT FROM FISH_INFO GROUP BY FISH_TYPE) A
LEFT JOIN FISH_NAME_INFO B
ON A.FISH_TYPE = B.FISH_TYPE
ORDER BY A.FISH_COUNT DESC



-- HR_DEPARTMENT -> 회사의 부서 정보
-- HR_EMPLOYEES -> 회사의 사원 정보
-- HR_GRADE -> 사원의 평가 정보
-- 사원별 성과금 정보
-- ** case when 사용법 익히기 **
SELECT A.EMP_NO,A.EMP_NAME, B.GRADE, CASE WHEN B.GRADE = 'S' THEN A.SAL*0.2
                                     WHEN B.GRADE = 'A' THEN A.SAL*0.15
                                     WHEN B.GRADE = 'B' THEN A.SAL*0.1
                                     ELSE 0
                                     END AS BONUS
FROM HR_EMPLOYEES A
LEFT JOIN
(SELECT EMP_NO, CASE WHEN SUM(SCORE)/COUNT(EMP_NO) >= 96 THEN 'S'
                   WHEN SUM(SCORE)/COUNT(EMP_NO) >=90 and SUM(SCORE)/COUNT(EMP_NO) <96 THEN 'A'
                   WHEN SUM(SCORE)/COUNT(EMP_NO) >=80 and SUM(SCORE)/COUNT(EMP_NO) <90 THEN 'B'
                   ELSE 'C' 
                   END AS GRADE
FROM HR_GRADE
WHERE YEAR = 2022
GROUP BY EMP_NO
) B
ON A.EMP_NO = B.EMP_NO
ORDER BY EMP_NO 
