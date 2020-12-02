#!/usr/bin/env ruby

input = File.readlines('input').map{|line| a,b,c,d = line.scan /\w+/; [a.to_i, b.to_i, c, d]}

# part 1
p input.count{|a,b,c,d| (a..b).include? d.count c}

# part 2
p input.count{|a,b,c,d| (d[a-1] == c) != (d[b-1] == c)}
