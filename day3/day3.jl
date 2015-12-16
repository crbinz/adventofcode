
function advent3(input)
    x, y = 0,0
    pts = [(x,y)]
    for char in input
        if char == '>'
        x+=1
    elseif char == '<'
        x-=1
    elseif char == '^'
        y+=1
    elseif char == 'v'
        y-=1
    end
    push!(pts,(x,y))
    end
    return pts
end

function advent3a(input)
    sx,sy = 0,0
    rx,ry = 0,0
    spts = [(sx,sy)]
    rpts = [(rx,ry)]
    robot = false
    for char in input
        if char == '>'
            dx,dy = 1,0
        elseif char == '<'
            dx,dy = -1,0
        elseif char == '^'
            dx,dy = 0,1
        elseif char == 'v'
            dx,dy = 0,-1
        end
        if robot
            rx += dx
            ry += dy
            robot = false
            push!(rpts,(rx,ry))
        else
            sx += dx
            sy += dy
            robot=true
            push!(spts,(sx,sy))
        end
    end
    return (spts,rpts)
end

input3 = open(readall,"input3.txt")

println("Part 1: ",length(unique(advent3(input3))))
(sp,rp) = advent3a(input3)
println("Part 2: ",length(unique(vcat(sp,rp))))
