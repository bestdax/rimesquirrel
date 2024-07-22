local function fig(s)
    local tmpfile = os.tmpname()
    os.execute("/opt/homebrew/bin/figlet " .. s .. " > " .. tmpfile)
    local f = io.open(tmpfile, "r")
    if f ~= nil then
        local fig_str = f:read("*all")
        f:close()
        os.remove(tmpfile)
        return fig_str
    end
end

local function translator(input, seg)
    if string.sub(input, 1, 1) == "F" then
        local figstr = fig(string.sub(input, 2))
        if figstr ~= "" then
            yield(Candidate("fig", seg.start, seg._end, figstr, "fig"))
        end
    end
end

return translator

