local function calculate(string) return load("return " .. string)() end

local function translator(input, seg)
    local result = nil
    if (input:sub(1, 1) == 'C') then
        result = calculate(input:sub(2))
        result = tostring(result)
        yield(Candidate("Calculator", seg.start, seg._end, result, "Cal"))
        yield(Candidate("Calculator", seg.start, seg._end,
                        input:sub(2) .. "=" .. result, "Cal"))
    end
end

return translator

