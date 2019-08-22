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

-- test1 = concatenate({"a","b","c"}, {"d","e","f"})
-- print_table(test1) 

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


local mt_add = {
    __add = concatenate
}


example1 = { "a", "b", "c" }
example2 = { "1", "2", 3 }

setmetatable(example1, mt_add)
setmetatable(example2, mt_add)
-- print_table(example1 + example2)

------------------------------------------

function remove_first(array)
    local result = array[1]
    array[1] = array[#array]
    array[#array] = nil
    return result
end

Queue = {
    _q = {}
}

function Queue:new()
    local obj = {}

    setmetatable(obj, self)
    self.__index = self

    return obj
end

function Queue:add(item)
    self._q[#self._q + 1] = item
end

function Queue:remove()
    local result = remove_first(self._q)
    return result
end


q = Queue:new()
q:add("33333")
q:add("FDSFSDF")
q:add("122")
print(q:remove())