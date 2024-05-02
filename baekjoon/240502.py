'''
19637 IF문 좀 대신 써줘
'''


import sys

n, m = map(int, sys.stdin.readline().split())
total_list = []
for i in range(n):
    a, b = sys.stdin.readline().split()
    total_list.append([a,int(b)])
    
total_list.sort(key=lambda x : x[1])

start, end = 0, len(total_list) - 1

def binary_search(start,end,total_list,cur):
    while start <= end:
        mid = (start+end)//2
        if cur > total_list[mid][1]:
            start = mid + 1
        else:
            end = mid - 1
    return total_list[start][0]

for _ in range(m):
    cur = int(sys.stdin.readline())
    print(binary_search(start,end,total_list,cur))
