----------------------------------------------------------------
-- Day 1 Easy
----------------------------------------------------------------
function ends_in_3(num)
    stringnum = tostring(num)
    return string.sub(stringnum, #stringnum, #stringnum) == "3"
end


-- very naive implementation of prime number check
function is_prime(num)
    if num <= 1 then
        return false
    end

    for i = 2, num - 1 do
        if num % i == 0 then
            return false
        end
    end

    return true
end


function print_prime_three(num)
    print("All prime numbers ending in 3 between 1 and "..num)
    for i = 1, num do
        if ends_in_3(i) and is_prime(i) then
            print(i)
        end
    end
end

-- print_prime_three(50)

----------------------------------------------------------------
-- Day 2 Medium
----------------------------------------------------------------
function for_loop(a, b, f)
    local i = a
    while i <= b do
        f(i)
        i = i + 1
    end
end

-- for_loop(1, 5, print)

----------------------------------------------------------------
-- Day 1 Hard
----------------------------------------------------------------
function reduce(max, init, f) 
    if (max <= 0) then
        return init
    end

    local v = f(max, init)
    -- tail call optimisation 💥
    return reduce(max - 1, v, f)
end

function add(previous, next)
    print("Adding "..previous.." and "..next)
    return previous + next
end

function multiply(previous, next)
    print("Multiplying "..previous.." and "..next)
    return previous * next
end

function factorial(num)
    return reduce(num, 1, multiply)
end
