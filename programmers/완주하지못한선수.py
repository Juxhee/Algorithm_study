def solution(participant, completion):
    # 자료구조 안에 데이터가 있는지 여부를 확인하는 문제이기 때문에(순서 상관X) 리스트보다 효율적인 딕셔너리로 & 동명이인 체크하기 위해 Counter 활용
    from collections import Counter
    part = Counter(participant)
    comp = Counter(completion)
    
    for i in participant:
        if i not in comp or part[i]!=comp[i]:
            return i
        
