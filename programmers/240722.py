
# 스택 큐 - 프로세스
def solution(priorities, location):
    from collections import deque
    answer = 0
    queue = deque()
    for i in range(len(priorities)):
        # idx를 유지해야하기 때문에 함꼐 추가해준다
        queue.append((priorities[i],i))
    while queue:
        max_p = max(queue)[0]
        p, idx = queue.popleft()
        # break 조건
        if p == max_p and idx == location:
            answer += 1
            break
        # 중요도가 가장 큰 값부터 빠져나옴
        elif p == max_p:
            answer += 1
        elif p != max_p:
            queue.append((p,idx))
    return answer

# 정렬 - 가장 큰 수
def solution(numbers):
    answer = ''
    numbers = list(map(str,numbers))
    numbers.sort(key=lambda x:x*3,reverse=True)
    for i in numbers:
        answer += i
    return str(int(answer))
