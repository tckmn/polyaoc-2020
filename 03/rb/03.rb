#!/usr/bin/env ruby

@input = open('input').readlines.map &:chomp

def go dx, dy = 1
    @input.each_slice(dy).map.with_index{|line, y| line[0][(y*dx) % line[0].size] == ?#}.count true
end

# part 1
p go 3

# part 2
p [1, 3, 5, 7, [1, 2]].map{|a| go *a}.inject :*
