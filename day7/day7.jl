function changeline!(line)
    line = replace(line,"->","=")
    line = replace(line,"AND","&")
    line = replace(line,"OR","|")
    line = replace(line,"NOT","~")
    line = replace(line,"LSHIFT","<<")
    line = replace(line,"RSHIFT",">>>")
    line = replace(line,"if","iff") # if is a keyword, messes up parsing
    line = replace(line,"do","doo") # if is a keyword, messes up parsing
end

function advent7(input)
    vars = Dict{Symbol,Union{Expr,Symbol,UInt16}}()
    for line in input
        line = changeline!(line)
        println(line)
        p = parse(line)
        reverse!(p.args) # assignment variable on the LHS
        for i = 1:length(p.args)
            try # plain Symbols have no field "head", so following will throw an error
                if p.args[i].head == :block # unrecognized variable name
                    p.args[i] = Symbol(p.args[i].args[2])
                end
            catch
            end
            #replace any existing symbol with its value
            if in(:args,fieldnames(p.args[i]))
                for j = 1:length(p.args[i].args)
                    if typeof(p.args[i].args[j]) == Symbol
                        if haskey(vars,p.args[i].args[j])
                            p.args[i].args[j] = vars[p.args[i].args[j]]
                        end
                    end
                end
            end
        end
        println(p)
        try
            vars[p.args[1]] = UInt16(eval(p))
        catch # something isn't yet defined
            vars[p.args[1]] = p
        end
    end
    return vars
end

function resolve!(v::Dict)
    for key in keys(v)
        if typeof(v[key]) == UInt16
            # everywhere :key is involved, replace with the value
            for key2 in keys(v)
                for a in v[key2].args
                    try
                        a = v[v[key]]
                    catch
                    end
                end
            end
        end
    end
    return v
end
        

f = open("input7.txt")
input = readlines(f)
close(f)

vars = advent7(input)
println("Part a: ",Int(vars[:x]))


