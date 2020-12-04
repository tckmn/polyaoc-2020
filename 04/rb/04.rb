#!/usr/bin/env ruby

part1 = part2 = 0

def year s, e; ->x{ x =~ /^\d\d\d\d$/ && (s..e) === x.to_i }; end
reqs = {
    'byr' => year(1920, 2002),
    'iyr' => year(2010, 2020),
    'eyr' => year(2020, 2030),
    'hgt' => ->x{ x =~ /^\d+cm$/ && (150..193) === x.to_i || x =~ /^\d+in$/ && (59..76) === x.to_i },
    'hcl' => /^#[\da-f]{6}$/.method(:match?),
    'ecl' => %w[amb blu brn gry grn hzl oth].method(:include?),
    'pid' => /^\d{9}$/.method(:match?)
}

File.open('input').read.split("\n\n").each do |rcd|
    hsh = rcd.split.map{|x| x.split ?:}.to_h
    part1 += 1 if reqs.all?{|k,v| hsh[k]}
    part2 += 1 if reqs.all?{|k,v| hsh[k] && v[hsh[k]]}
end

p part1, part2
