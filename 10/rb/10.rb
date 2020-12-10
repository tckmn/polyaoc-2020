#!/usr/bin/env ruby

arr = File.readlines('input').map(&:to_i).sort
arr.unshift 0
arr.push arr[-1]+3

# part 1
diffs = arr.each_cons(2).map{|x,y| y-x}
p diffs.count(1) * diffs.count(3)

# part 2
memo = {}
define_method 'get' do |val|
    return 0 unless arr.include? val
    return 1 if val == arr[-1]
    memo[val] ||= get(val+1) + get(val+2) + get(val+3)
end
p get 0
