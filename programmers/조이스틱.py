# 조이스틱 - 그리디
# 알파벳 조작은 쉬움
# 커서 이동이 문제..!


def solution(name):
    answer = 0
    # 첫 알파벳부터 순차적으로 커서 이동
    min_move = len(name) - 1
    answer = 0
    for i in range(len(name)):
        answer +=min(abs(ord('A')-ord(name[i])),abs(ord('Z')-ord(name[i])+1))

        # 해당 알파벳 다음부터 연속된 A 찾는다
        next = i + 1
        while next < len(name) and name[next] == 'A':
            next += 1
            
        # 이전 단계까지의 최소 커서 이동 수, 연속된 A의 왼쪽부터 시작하는 경우, 연속된 A의 오른쪽부터 시작하는 경우 
        # 비교해서 최솟값으로 갱신시켜준다 
        min_move = min([min_move, 2 *i + len(name) - next, i + 2 * (len(name) -next)])
    return min_move + answer
