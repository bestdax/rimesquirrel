-- read data
local function read(path)
    local f = io.open(path, 'rb')
    if f then
        local content = f:read('*all')
        f:close()
        return content
    end
end

local file = '/Users/dax/Library/Rime/lua/enwords.txt'
local content = read(file)

local function match_pattern(input)
    local pattern = '[^\n]*'
    for i = 1, #input do
        local c = string.sub(input, i, i)
        pattern = pattern .. '[' .. c .. c:gsub('^%l', string.upper) .. ']' ..
                      '[^\n]*'
    end
    return string.gmatch(content, pattern)
end

local function yield_cand(seg, text, tag, quality)
    local cand = Candidate("string", seg.start, seg._end, text, tag)
    cand.quality = quality
    yield(cand)
end

local function fuzzy_translator(input, seg, env)
    if input == ' ' then
        env.engine.context:commit()
    end
    local count = 0
    local s = input
    if string.find(content, '\n' .. s .. '\n') then
        local cand = Candidate("string", seg.start, seg._end, input, "RAW")
        cand.quality = 1
        s = s:gsub('^%l', string.upper)
        local cand1 = Candidate("string", seg.start, seg._end, s, "RAW")
        cand1.quality = 2
        yield(cand)
        yield(cand1)
    end
    local results = match_pattern(input)
    if not results then
        yield_cand(seg, input, "RAW", 1)
    else
        for word in match_pattern(input) do
            count = count + 1
            yield_cand(seg, word, "RE", count)
            if (count > 5) then
                break
            end
        end
    end
    content = read(file)
end

return fuzzy_translator
