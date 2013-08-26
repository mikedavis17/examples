#!/usr/bin/env python3

import random

def getone(count_w, max_w, max_r, total) :
    """Create one lottery number with given constraints.

    COUNT_W is the number of white balls.
    MAX_W   is the largest value of white ball.
    MAX_R   is the largest value of red ball.
    TOTAL   is the desired sum of white balls.

    """

    values = [x for x in range(1, max_w+1)]
    if count_w > max_w :
        return None
    if sum(values[:count_w]) > total :
        return None
    if sum(values[-count_w:]) < total :
        return None
    
    while True :
        sample = random.sample(values, count_w) 
        if sum(sample) == total :
            break

    sample.sort()
    return (sample, random.randint(1, max_r))

def main() :
    N_W   = 5
    MAX_W = 59
    MAX_R = 35
    SUM   = 153

    pick = getone(N_W, MAX_W, MAX_R, SUM)
    print(pick)

if __name__ == '__main__' :
    main()
