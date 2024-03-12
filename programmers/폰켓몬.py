def solution(nums):
    from collections import Counter
    # 포켓몬 종류 수(고유)
    num_mon = len(Counter(nums))
    # 가져가려는 포켓몬 수
    max_mon = len(nums)/2
    if num_mon > max_mon:
        return max_mon
    else :
        return num_mon

  '''
  해시 문제라서 Counter 활용했는데, 단순히 len(set(list))으로 포켓몬 종류 수 찾아도 될듯
  '''
