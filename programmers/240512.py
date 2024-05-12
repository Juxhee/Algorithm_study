# [PCCE 기출문제] 10번 / 데이터 분석
# https://school.programmers.co.kr/learn/courses/30/lessons/250121
def solution(data, ext, val_ext, sort_by):
    answer = []
    index_dict = {'code':0,'date':1,'maximum':2,'remain':3}
    ext_idx = index_dict[ext]
    sort_idx = index_dict[sort_by]
    for i in range(len(data)):
        if data[i][ext_idx] < val_ext:
            answer.append(data[i])
    
    return sorted(answer, key = lambda x : x[sort_idx])
