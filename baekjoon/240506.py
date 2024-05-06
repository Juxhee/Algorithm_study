# 1966 프린터 큐

from collections import deque
num = int(input())
for _ in range(num):
    n, m = map(int, input().split())
    importance = list(map(int,input().split()))
    queue = deque([])
    for i in range(n):
        queue.append((importance[i],i))

    i = 0
    while queue:
        max_import = max(queue)[0]
        x,y = queue.popleft()
        
        if x == max_import and y != m:
            i += 1
        elif x == max_import and y == m:
            i += 1
            print(i)
        elif x != max_import:
            queue.append((x,y))
