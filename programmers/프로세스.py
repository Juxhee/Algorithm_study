def solution(priorities, location):
    answer = 0
    from collections import deque
    q = deque([(i,p) for i,p in enumerate(priorities)])
    while True:
        cur = q.popleft()
        if any(cur[1] < j[1] for i,j in enumerate(q)):
            q.append(cur)
        else:
            answer += 1
            if location == cur[0]:
                return answer
    return answer
