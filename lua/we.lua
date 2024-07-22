-- we_translator: 将 `wechat emoji` 翻译为颜文字并乘以数量，输入`W50wx`则翻译成50个微笑表情。
-- 触发键为W，数字在表情代码的前后没有关系，具体的表情代码见下面的定义。
-- 使用说明：
-- 将we.lua拷贝到Rime文件夹中的lua文件夹，没有的话新建
-- 在rime文件夹的rime.lua文件中添加一行：`wemoji_translator = require("we")`
-- 在输入法在schema.yaml文件(比如wubi86.schema.yaml)中的translators部分，添加一行： `- lua_translator@wemoji_translator`
-- dax 2023/03/01 08:34:42
local emojis = {}

emojis["am"] = "[傲慢]"
emojis["an"] = "[爱你]"
emojis["aq"] = "[爱情]"
emojis["ax"] = "[爱心]"
emojis["bb"] = "[便便]"
emojis["bq"] = "[抱拳]"
emojis["bs"] = "[鄙视]"
emojis["by"] = "[白眼]"
emojis["bz"] = "[爆竹]"
emojis["bzu"] = "[闭嘴]"
emojis["cd"] = "[菜刀]"
emojis["cg"] = "[吃瓜]"
emojis["ch"] = "[擦汗]"
emojis["cj"] = "[差劲]"
emojis["cy"] = "[呲牙]"
emojis["d"] = "[刀]"
emojis["dg"] = "[蛋糕]"
emojis["dk"] = "[大哭]"
emojis["dl"] = "[打脸]"
emojis["dx"] = "[凋谢]"
emojis["dy"] = "[得意]"
emojis["f"] = "[饭]"
emojis["fa"] = "[發]"
emojis["fby"] = "[翻白眼]"
emojis["fd"] = "[发呆]"
emojis["fdo"] = "[奋斗]"
emojis["fdou"] = "[发抖]"
emojis["fl"] = "[疯了]"
emojis["fn"] = "[发怒]"
emojis["fw"] = "[飞吻]"
emojis["gg"] = "[尴尬]"
emojis["gy"] = "[勾引]"
emojis["gz"] = "[鼓掌]"
emojis["h"] = "[汗]"
emojis["hb"] = "[红包]"
emojis["hd"] = "[好的]"
emojis["hh"] = "[嘿哈]"
emojis["hq"] = "[哈欠]"
emojis["hs"] = "[合十]"
emojis["ht"] = "[回头]"
emojis["hx"] = "[坏笑]"
emojis["hxi"] = "[憨笑]"
emojis["hxiu"] = "[害羞]"
emojis["j"] = "[囧]"
emojis["je"] = "[饥饿]"
emojis["jk"] = "[惊恐]"
emojis["jx"] = "[奸笑]"
emojis["jy"] = "[惊讶]"
emojis["jyo"] = "[加油]"
emojis["jz"] = "[机智]"
emojis["kb"] = "[抠鼻]"
emojis["kf"] = "[咖啡]"
emojis["kj"] = "[恐惧]"
emojis["kkl"] = "[快哭了]"
emojis["kl"] = "[可怜]"
emojis["klo"] = "[骷髅]"
emojis["ks"] = "[苦涩]"
emojis["kt"] = "[磕头]"
emojis["k"] = "[酷]"
emojis["ku"] = "[困]"
emojis["lh"] = "[流汗]"
emojis["lha"] = "[冷汗]"
emojis["lho"] = "[脸红]"
emojis["lk"] = "[裂开]"
emojis["ll"] = "[流泪]"
emojis["lll"] = "[666]"
emojis["lq"] = "[篮球]"
emojis["lw"] = "[礼物]"
emojis["mg"] = "[玫瑰]"
emojis["ng"] = "[难过]"
emojis["no"] = "[NO]"
emojis["oh"] = "[怄火]"
emojis["ok"] = "[OK]"
emojis["pc"] = "[瓢虫]"
emojis["pj"] = "[啤酒]"
emojis["pp"] = "[乒乓]"
emojis["ptwx"] = "[破涕为笑]"
emojis["pz"] = "[撇嘴]"
emojis["q"] = "[强]"
emojis["qd"] = "[敲打]"
emojis["qdl"] = "[糗大了]"
emojis["qq"] = "[亲亲]"
emojis["qt"] = "[拳头]"
emojis["qz"] = "[庆祝]"
emojis["r"] = "[弱]"
emojis["s"] = "[衰]"
emojis["sb"] = "[生病]"
emojis["sd"] = "[闪电]"
emojis["se"] = "[色]"
emojis["sh"] = "[睡]"
emojis["shi"] = "[嘘]"
emojis["shu"] = "[社会社会]"
emojis["sl"] = "[胜利]"
emojis["sw"] = "[失望]"
emojis["t"] = "[吐]"
emojis["ta"] = "[天啊]"
emojis["tp"] = "[调皮]"
emojis["tq"] = "[叹气]"
emojis["ts"] = "[跳绳]"
emojis["tt"] = "[跳跳]"
emojis["tx"] = "[偷笑]"
emojis["txi"] = "[投降]"
emojis["ty"] = "[太阳]"
emojis["w"] = "[哇]"
emojis["wc"] = "[旺柴]"
emojis["wl"] = "[捂脸]"
emojis["wq"] = "[委屈]"
emojis["ws"] = "[握手]"
emojis["wx"] = "[微笑]"
emojis["wy"] = "[无语]"
emojis["x"] = "[吓]"
emojis["xg"] = "[西瓜]"
emojis["xl"] = "[笑脸]"
emojis["xs"] = "[心碎]"
emojis["y"] = "[耶]"
emojis["yb"] = "[拥抱]"
emojis["yh"] = "[烟花]"
emojis["yhh"] = "[右哼哼]"
emojis["yk"] = "[愉快]"
emojis["yl"] = "[月亮]"
emojis["yun"] = "[晕]"
emojis["yw"] = "[疑问]"
emojis["yx"] = "[阴险]"
emojis["yxi"] = "[悠闲]"
emojis["zc"] = "[嘴唇]"
emojis["zd"] = "[炸弹]"
emojis["zhh"] = "[左哼哼]"
emojis["zj"] = "[再见]"
emojis["zk"] = "[抓狂]"
emojis["zm"] = "[咒骂]"
emojis["zq"] = "[足球]"
emojis["zqu"] = "[转圈]"
emojis["zt"] = "[猪头]"

local function str_multiply(s, n)
    local r = ""
    for _ = 1, n do r = r .. s end
    return r
end

local function random_emojis(n)
    local keys = {}
    for k in pairs(emojis) do table.insert(keys, k) end
    local r = ""
    for _ = 1, n do
        local key = keys[math.random(#keys)]
        r = r .. emojis[key]
    end
    return r
end

-- gen_emoji_str函数将输入的字符串分离成数字和表情符号，并根据数字重复
-- 如果没有表情代码则随机生成表情
local function gen_emoji_str(str)
    local n = str:gmatch("%d+")()
    if (not n) then
        n = 1
    else
        n = tonumber(n)
    end
    local emoji = str:gmatch("%a+")()
    local r1 = ""
    if not emoji then
        r1 = random_emojis(n)
    else
        for _ = 1, n do r1 = r1 .. emojis[emoji] end
    end
    return r1
end

local function translator(input, seg)
    if (string.sub(input, 1, 1) == "W") then
        local str = string.sub(input, 2)
        local r1 = gen_emoji_str(str)
        yield(Candidate("we", seg.start, seg._end, r1, "Wemoji"))
    end
end

return translator

