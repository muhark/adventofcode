using DelimitedFiles;
using Combinatorics;

# Read in data, downloaded manually
X = readdlm("input.txt", '\n', Int);

# Part 1: C(2) Solution
for c in collect(combinations(1:length(X), 2))
    y = X[c[1]] + X[c[2]]
    if y == 2020
        println("Match Found!")
        println(c)
        println(X[c[1]]*X[c[2]])
        break
    end
end
# Part 2: C(3) Solution
for c in collect(combinations(1:length(X), 3))
    y = X[c[1]] + X[c[2]] + X[c[3]]
    if y == 2020
        println("Match Found!")
        println(c)
        println(X[c[1]]*X[c[2]]*X[c[3]])
        break
    end
end

# Bonus: C(n) Solution
function f(X, C)
    for c in collect(combinations(1:length(X), C))
        y = sum(X[c])
        if y == 2020
            println("Match Found!")
            println(c)
            println(prod(X[c]))
            break
        end
    end
end

f(X, 2)
f(X, 3)
