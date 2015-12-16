
function advent2(input2)
    area = 0
    for i =1:size(input2,1)
        area += 2*input2[i,1]*input2[i,2] + 2*input2[i,2]*input2[i,3] + 2*input2[i,3]*input2[i,1]
        tmp = vec(input2[i,:])
        sort!(tmp)
        area += tmp[1]*tmp[2]
    end
    return area
end

function advent2a(input)
    length = 0
    for i = 1:size(input,1)
        volume = input[i,1]*input[i,2]*input[i,3]
        tmp = vec(input[i,:])
        sort!(tmp)
        length += 2*tmp[1]+2*tmp[2]+volume
    end
    return length
end

input2 = readdlm("input2.txt",'x')

println("Part 1: ",advent2(input2))
println("Part 2: ",advent2a(input2))
