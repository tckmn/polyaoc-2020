#!/usr/bin/env ruby

require 'set'

hsh = {}
File.readlines('input').each do |line|
    next if line =~ /no other/
    line =~ /(.*) bags contain (.*)./
    hsh[$1] = $2.split(', ').map{|x| x.sub(/ bags?/, '').split ' ', 2}
end

def part1 hsh, bag
    hsh.select{|k, v| v.include? bag}.map{|k, v| part1 hsh, k}.reduce(Set[bag], :+)
end

def part2 hsh, bag
    hsh[bag] ? hsh[bag].sum{|n, x| n.to_i * (1 + part2(hsh, x))} : 0
end

p part1(hsh.transform_values{|x| x.map &:last}, 'shiny gold').size - 1
p part2 hsh, 'shiny gold'
