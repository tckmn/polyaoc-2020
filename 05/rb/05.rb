#!/usr/bin/env ruby

seats = File.readlines('input').map{|x| x.tr('FBLR', '0101').to_i 2 }

p seats.max
p seats.sort.each_cons(2).find{|a,b| a+1 != b }.sum / 2
