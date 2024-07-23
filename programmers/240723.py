'''
프로그래머스 - 다리를 지나는 트럭
'''

def solution(bridge_length, weight, truck_weights):
    from collections import deque
    bridge = deque([0]*bridge_length)
    queue = deque(truck_weights)
    time = 0
    w = 0
    while queue:
        out_t = bridge.popleft()
        w -= out_t
        if w + queue[0] <=weight:
            in_t = queue.popleft()
            w += in_t
            bridge.append(in_t)
        else:
            bridge.append(0)
        time += 1
    return bridge_length + time
