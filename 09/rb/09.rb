#!/usr/bin/env ruby

input = File.readlines('input').map &:to_i

# part 1
val = input.each_cons(26).find{|*a, n| !a.combination(2).map(&:sum).include?(n)}.last
p val

# part 2
start, stop, sum = 0, 0, input[0]
while sum != val
    if sum < val
        stop += 1
        sum += input[stop]
    else
        sum -= input[start]
        start += 1
    end
end
p input[start..stop].minmax.sum
