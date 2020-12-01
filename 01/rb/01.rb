#!/usr/bin/env ruby

input = File.readlines('input').map &:to_i

# both parts
[2, 3].each do |n|
    p input.combination(n).find{|nums| nums.sum == 2020}.inject :*
end
