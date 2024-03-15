def solution(bridge_length, weight, truck_weights):
    from collections import deque
    bridge = deque([0]*bridge_length)
    truck_weights = deque(truck_weights)
    w = 0
    t = 0
    while truck_weights:
        w -= bridge.popleft()
        if w + truck_weights[0]<=weight:
            truck = truck_weights.popleft()
            bridge.append(truck)
            w += truck
        else:
            bridge.append(0)
        print(bridge)
        t +=1
           
    
    
    return bridge_length + t
