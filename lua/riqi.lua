-- riqi_translator: 将 `D` + 2-13译成2月13日
-- 因为用五笔输入2月13日,月和日都要敲4次键，感觉不方便，所以写了这个小功能
-- 使用说明：
-- 将riqi.lua拷贝到Rime文件夹中的lua文件夹，没有的话新建
-- 在rime文件夹的rime.lua文件中添加一行：`riqi_translator = require("riqi")`
-- 在输入法在schema.yaml文件(比如wubi86.schema.yaml)中的translators部分，添加一行： `- lua_translator@riqi_translator`
-- dax 2023/03/01 08:35:44
-- split函数将数字分成三段，如果不足三段补充0
local function split(date_str)
    local fields = {}
    for field in date_str:gmatch("%d+") do
        table.insert(fields, tonumber(field))
    end
    for i = 1, 3 do if (not fields[i]) then table.insert(fields, 1, 0) end end
    return fields
end

-- gen_string函数将年月日的数字拼上单位，如果数字是0就舍弃
-- 此函数不会判断日期是否合法 只会做简单的判断，月份不能超过12， 日期不能超过31
local function gen_string(date_table)
    local date_str = ""
    local year = date_table[1]
    local month = date_table[2]
    local day = date_table[3]
    if (year > 0) then date_str = date_str .. year .. "年" end
    if (month > 0 and month < 13) then date_str = date_str .. month .. "月" end
    if (day > 0 and day < 32) then date_str = date_str .. day .. "日" end
    return date_str
end

-- 主函数 设置输出内容
local function translator(input, seg)
    if (string.sub(input, 1, 1) == "D") then
        local date_input_string = string.sub(input, 2)
        if date_input_string ~= nil then
            local date_table = split(input)
            local date_str = gen_string(date_table)
            if date_str ~= "" then
                yield(Candidate("string", seg.start, seg._end, date_str,
                                "日期"))
            end
        end

    end
end

return translator
