#!/usr/bin/env ruby

def run code, idx=nil
    if idx
        return if code[idx][0] == 'acc'
        code = code.map &:dup
        code[idx][0] = code[idx][0] == 'jmp' ? 'nop' : 'jmp'
    end

    executed = code.map{false}
    i = 0
    acc = 0
    loop {
        if i == code.length
            puts acc
            return :eof
        end
        return acc if executed[i]
        executed[i] = true
        case code[i][0]
        when 'acc' then acc += code[i][1]; i += 1
        when 'jmp' then i += code[i][1]
        when 'nop' then i += 1
        end
    }
end

code = File.readlines('input').map{|line| a, b = line.split; [a, b.to_i]}

# part 1
p run code

# part 2
(0..).find{|i| run(code, i) == :eof}
