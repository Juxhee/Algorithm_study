# 이코테 그리디
# 거스름돈
N = 1600
num = 0
money = [500,100,50,10]
for i in range(4):
    if N >= money[i]:
        num += N // money[i]
        N = N - (money[i]*num)
print(num)


# 큰수의 법칙
n, m, k = map(int,input().split())
n_list = list(map(int,input().split()))

n_list.sort(reverse=True)
first = n_list[0]
second = n_list[1]
num = 0

while m > 0:
    for i in range(k):
        num += first
        m -= 1
    num += second
    m -=1
print(num)


# 숫자 카드 게임
n, m = map(int,input().split())
graph = []
for i in range(n):
    graph.append(list(map(int,input().split())))

num = 0
for i in graph:
    if num < min(i):
        num = min(i)
print(num)
    
    
# 1이 될때까지
n, k = map(int, input().split())
num = 0

while n > 1:
    if n % k == 0:
        n /= k
        num += 1
    else:
        n -= 1
        num += 1
print(num)
