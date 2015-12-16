using Nettle


function advent4(input)
    h = Hasher("md5")
    num = 0
    while true
        update!(h,input*string(num))
        if hexdigest!(h)[1:5] == "00000"
            return num
        else
            num +=1
        end
    end
end

function advent4a(input)
    h = Hasher("md5")
    num = 0
    while true
        update!(h,input*string(num))
        if hexdigest!(h)[1:6] == "000000"
            return num
        else
            num +=1
        end
    end
end

# Your puzzle input is iwrupvqb
println("Part a: ",advent4("iwrupvqb"))
println("Part b: ",advent4a("iwrupvqb"))
