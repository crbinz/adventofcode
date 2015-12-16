
function advent5(input)
    goodcount = 0
    rvowels = r"[aeiou].*[aeiou].*[aeiou].*"
    rdouble = r"([a-z])\1+"
    rneg = r"^((?!(ab|cd|pq|xy)).)*$"

    for line in input
        # contains at least 3 vowels
        if ismatch(rvowels,line) &&
            ismatch(rdouble,line) &&
            ismatch(rneg,line)
            goodcount += 1
        end
    end
    return goodcount
end

function contains_double(s)
    for i = 1:length(s)-1
        sub = s[i:i+1]
        (split1,split2) = split(s,sub)
        if contains(s[1:i-1],sub) || contains(s[i+2:end],sub)
            return true
        end
    end
    return false
end

function repeats_with_one(s)
    for i = 1:length(s)-2
        c = s[i]
        if s[i+2] == c
            return true
        end
    end
    return false
end


function advent5a(input)
    goodcount = 0

    for line in input
        # contains at least 3 vowels
        if contains_double(line) && repeats_with_one(line)
            goodcount += 1
        end
    end
    return goodcount
end

f = open("input5.txt")
input = readlines(f)
close(f)
println("Part a: ", advent5(input))
println("Part b: ", advent5a(input))
