--[[
dttm_translator: 将 `dttm` 翻译为当前时间
--]] local function translator(input, seg)
    if (input == "dttm") then
        yield(Candidate("dttm", seg.start, seg._end, os.date("%Y%m%d%H%M%S"),
                        "日期时间"))
    end
end

return translator
