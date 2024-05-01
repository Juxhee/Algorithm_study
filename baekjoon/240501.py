#11724 연결 요소의 개수

import sys
sys.setrecursionlimit(10000)

N, M = map(int, sys.stdin.readline().split())
grid = [[False]*(N) for _ in range(N)]
visited = [False for _ in range(N)]

for _ in range(M):
    x, y = map(int, sys.stdin.readline().split())
    grid[x-1][y-1] = True
    grid[y-1][x-1] = True


def dfs(x):
    visited[x] = True
    for i in range(N):
        if grid[x][i] and not visited[i]:
            dfs(i)

answer = 0
for i in range(N):
    if not visited[i]:
        dfs(i)
        answer +=1
            
print(answer)
