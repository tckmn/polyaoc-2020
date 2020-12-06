#!/usr/bin/env ruby

input = File.read('input').split("\n\n").map{|x| x.lines.map{|line| line.chomp.chars}}

puts [:|, :&].map{|sym| input.map{|x| x.reduce(sym).size}.sum}
