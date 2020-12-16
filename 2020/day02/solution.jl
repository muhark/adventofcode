using DelimitedFiles;

# Read in data, downloaded manually
input = readdlm("input", '\n', String);

# Parse strings
pattern = r"^([0-9]+)-([0-9]+) ([a-z]): ([a-z]+$)"
map(m -> match(pattern, m).captures, input)

function f(m)
    p = match(pattern, m).captures
    n_char = count(i->(i==p[3][1]), p[4])
    return parse(Int, p[1]) <= n_char <= parse(Int,p[2])
end

sum(map(f, input))

# Part 2
function g(m)
    p = match(pattern, m).captures
    return xor(
        p[4][parse(Int, p[1])] == p[3][1],
        p[4][parse(Int, p[2])] == p[3][1])
end
