# 백준 10451 순열 사이클

def dfs(x,graph,visited):
    visited[x] = True
    next = graph[x-1]
    if not visited[next]:
        dfs(next,graph,visited)

T = int(input())
for i in range(T):
    N = int(input())
    graph = list(map(int,input().split()))
    visited = [False]*(N+1)
    answer = 0 
    for i in range(1,N+1):
        if not visited[i]:
            dfs(i,graph,visited)
            answer += 1
    print(answer)

# 9466 텀 프로젝트
def dfs(cur,arr):
    visited[cur] = True
    cycle.append(cur)
    next = graph[cur-1]
    if visited[next]:
        if next in cycle:
            arr += cycle[cycle.index(next):]
            return
    else:
        dfs(next,arr)

T = int(input())
for i in range(T):
    n = int(input())
    graph = list(map(int,input().split()))
    visited = [False] * (n+1)
    
    student = []
    for i in range(1,n+1):
        if not visited[i]:
            cycle = []
            dfs(i,student)
    print(n-len(student))
