def solution(clothes):
    dict = {}
    # 해시테이블로 카테고리별 의상 담아두는게 포인트
    for i,j in clothes:
        if j in dict.keys():
            dict[j] += [i]
        else:
            dict[j] = [i]
    answer = 1
    # (N+1)(M+1)로 쉽게 계산 가능 -> 이걸 몰랐음
    for _, value in dict.items():
        answer *= (len(value) + 1)
    return answer -1
