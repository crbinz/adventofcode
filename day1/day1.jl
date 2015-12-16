
function advent1(input)
    count = 0
    for char in input
        if char == '('
            count+=1
        elseif char == ')'
            count-=1
        end
    end
    return count
end

function advent1a(input)
    count=0
    for i = 1:length(input)
        if input[i] == '('
        count+=1
        elseif input[i] == ')'
        count-=1
        end
        if count == -1
            println("Basement: ",i)
        end
    end
    return count
end

input1 = open(readall,"input1.txt")
advent1(input)
advent1a(input)

