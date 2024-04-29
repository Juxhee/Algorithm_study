'''
1012 유기농배추
'''


# 재귀 한계를 수정해줘야 함
import sys
sys.setrecursionlimit(10000)

T = int(sys.stdin.readline())

for t in range(T):
    M,N,K = map(int,sys.stdin.readline().split())
    grid = [[False]*N for i in range(M)]

    for i in range(K):
        x,y = map(int,sys.stdin.readline().split())
        grid[x][y] = True
    visited = [[False]*N for i in range(M)]
    def dfs(x,y):
        dx = [-1,1,0,0]
        dy = [0,0,-1,1]
        visited[x][y] = True
        for i in range(4):
            next_x = dx[i] + x
            next_y = dy[i] + y
            if next_x >= 0 and next_x < M and next_y >= 0 and next_y < N and grid[next_x][next_y]:
                if not visited[next_x][next_y]:
                    dfs(next_x,next_y)
                    
    answer = 0
    for i in range(M):
        for j in range(N):
            if grid[i][j] and not visited[i][j] :
                dfs(i,j)
                answer += 1

    print(answer)
