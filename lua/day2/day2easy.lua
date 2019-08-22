function print_table(t)
    for k, v in pairs(t) do
        print(k .. ", " .. v)
    end
end

function concatenate(a1, a2)
    local result = {}
    for i, v in pairs(a1) do
        result[i] = v
    end

    for i, v in pairs(a2) do
        result[i + #a1] = v
    end

    return result
end

test1 = concatenate({"a","b","c"}, {"d","e","f"})
print_table(test1) 

---------------------------------------------------------

local _private = {}

function strict_read(table, key)
    if _private[key] then
        return _private[key]
    else
        error("Invalid key: " .. key)
    end
end

function strict_write(table, key, value)
    if _private[key] and not value == nil then
        error("Duplicate key: " .. key)
    else
        _private[key] = value
    end
end

local mt = {
    __index = strict_read,
    __newindex = strict_write
}

treasure = {}
setmetatable(treasure, mt)

