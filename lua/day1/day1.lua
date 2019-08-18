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

function for_loop(a, b, f)
    local i = a
    while i <= b do
        f(i)
        i = i + 1
    end
end

-- for_loop(1, 5, print)