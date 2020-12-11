#!/usr/bin/env ruby

seats = File.readlines('input').map{|x| [?*, *x.chomp.chars, ?*]}
tmp = seats[0].map{?*}
seats.unshift tmp
seats.push tmp

adj8 = [-1,0,1].product([-1,0,1]) - [[0,0]]

sight = seats.map.with_index{|row,i| row.map.with_index{|seat,j|
    seat != ?* && adj8.map{|dx,dy|
        x,y = i+dx, j+dy
        (x+=dx) && (y+=dy) while seats[x][y] == ?.
        [x-i,y-j]
    }
}}

define_method 'part' do |pt|
    arr = seats.map &:dup

    while (new = arr.map.with_index{|row,i| row.map.with_index{|seat,j|
        if seat == ?L || seat == ?#
            num = (pt == 1 ? adj8 : sight[i][j]).count{|dx,dy| arr[i+dx][j+dy] == ?#}
            seat == ?L ? (num == 0 ? ?# : ?L) : (num >= (pt == 1 ? 4 : 5) ? ?L : ?#)
        else
            seat
        end
    }}) != arr
        arr = new
    end

    p arr.sum{|row| row.count ?#}
end

part 1
part 2
