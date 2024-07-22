-- repeat_translator: ，输入`R79u`输出79个u。
-- 触发键为R，数字在前后没有关系。
-- 使用说明：
-- 将repeat.lua拷贝到Rime文件夹中的lua文件夹，没有的话新建
-- 在rime文件夹的rime.lua文件中添加一行：`repeat_translator = require("repeat")`
-- 在输入法在schema.yaml文件(比如wubi86.schema.yaml)中的translators部分，添加一行： `- lua_translator@repeat_translator`
-- dax 2023/03/09 14:29:06

local function gen_output(s)
    local n = tonumber(string.gmatch(s, "%d+")())
    local str = string.gmatch(s, "%D+")()
    local r = ""
    for _ = 1, n do
        r = r .. str
    end
    return r
end

local function translator(input, seg)
    if (string.sub(input, 1, 1) == "R") then
        local r = gen_output(string.sub(input, 2))
        yield(Candidate("String", seg.start, seg._end, r, "字符乘法"))
    end
end

return translator

