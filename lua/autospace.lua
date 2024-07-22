local F = {}
-- read data
local function read(path)
    local f = io.open(path, 'rb')
    if f then
        local content = f:read('*all')
        f:close()
        return content
    end
end

local function write(path, content)
    local f = io.open(path, 'w')
    if f then
        f:write(content)
        f:close()
    end
end

local file = '/Users/dax/Library/Rime/lua/enwords.txt'
local content = read(file)

function F.init(env)
    env.size = 20
    env.history = {}

    env.notifier = env.engine.context.commit_notifier:connect(function(ctx)
        for i = env.size, #env.history do
            env.history[i] = nil
        end
        table.insert(env.history, 1, ctx:get_selected_candidate().text)
    end)
end
function F.fini(env)
    env.notifier:disconnect()
end
function F.tag_match(seg, env)
    -- return  env.engine.context:get_option('auto_space")  -- 可以加上開關
    return true
end

function F.func(inp, env)
    local pre_space = ""
    if env.history[1] and not env.history[1]:find(" $") then
        pre_space = " "
    end

    for cand in inp:iter() do
        cand.text = pre_space .. cand.text
        yield(cand)
    end
    local last_commit_text = env.history[1]
    last_commit_text = string.gsub(last_commit_text, '^%s+', '')
    last_commit_text = string.gsub(last_commit_text, '%s+$', '')
    content = read(file)
    if not string.match(content, '\n' .. last_commit_text .. '\n') then
        content = last_commit_text .. '\n' .. content
        write(file, content)
    end
end

return F
