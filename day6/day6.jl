function parse_line(line)
    findpairs = r"(\d{1,}),(\d{1,}) through (\d{1,}),(\d{1,})"
    m = match(findpairs,line)
    x1,y1,x2,y2 = map(parse,(Int,Int,Int,Int),(m.captures...))

    if contains(line,"on")
        action = "on"
    elseif contains(line,"off")
        action = "off"
    else
        action = "toggle"
    end

    return (x1,y1,x2,y2,action)
end

function advent6(input)
    lights = Array{Bool}(1000,1000)
    fill!(lights,false) # all off

    for line in input
        (x1,y1,x2,y2,action) = parse_line(line)

        if action == "on"
            lights[min(x1,x2)+1:max(x1,x2)+1,
                   min(y1,y2)+1:max(y1,y2)+1] = true # change to 1-based indexing
        elseif action == "off"
            lights[min(x1,x2)+1:max(x1,x2)+1,
                   min(y1,y2)+1:max(y1,y2)+1] = false # change to 1-based indexing
        elseif action == "toggle"
            [lights[i,j] = !lights[i,j] for i = min(x1,x2)+1:max(x1,x2)+1,
                                            j = min(y1,y2)+1:max(y1,y2)+1]
        end
    end
    return length(find(lights))
end

function advent6a(input)
    lights = zeros(Int,1000,1000)

    for line in input
        (x1,y1,x2,y2,action) = parse_line(line)

        if action == "on"
            lights[min(x1,x2)+1:max(x1,x2)+1,
                   min(y1,y2)+1:max(y1,y2)+1] += 1 # change to 1-based indexing
        elseif action == "off"
            lights[min(x1,x2)+1:max(x1,x2)+1,
                   min(y1,y2)+1:max(y1,y2)+1] -= 1 # change to 1-based indexing
        elseif action == "toggle"
            lights[min(x1,x2)+1:max(x1,x2)+1,
                   min(y1,y2)+1:max(y1,y2)+1] += 2 # change to 1-based indexing
        end
        lights[lights.<0] = 0 # minimum of zero
    end
    return sum(lights)
end

input = open(readlines,"input6.txt")
println("Part a: ",advent6(input))
println("Part b: ",advent6a(input))
