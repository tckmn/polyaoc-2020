#!/usr/bin/env julia

input = sort(map(x->parse(Int, x), readlines("input")))
pushfirst!(input, 0)    # well aren't you cool and different, julia
push!(input, input[end]+3)

# part 1
diffs = diff(input)
println(count(diffs .== 1) * count(diffs .== 3))

# part 2
const memo = Dict{Int,Int}()
function ways(n)
    n ∉ input       ? 0 :
    n == input[end] ? 1 :
    get!(() -> sum(ways, n+1:n+3), memo, n)
end
println(ways(0))
