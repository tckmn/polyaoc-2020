#!/usr/bin/env python3

from functools import reduce
import itertools
import operator

data = map(int, open('input').readlines())

# both parts
for n in [2, 3]:
    print(next(reduce(operator.mul, nums)
               for nums in itertools.combinations(input, n)
               if sum(nums) == 2020))
