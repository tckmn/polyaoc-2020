#!/usr/bin/env julia

function go(input, dx, dy=1)
    sum(((y, line),) -> line[mod1(1 + dx*(y-1), length(line))] == '#', enumerate(input[1:dy:end]))
end

input = readlines("input")

println(go(input, 3))
println(prod(x -> go(input, x...), [1, 3, 5, 7, [1, 2]]))
