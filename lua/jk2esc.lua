local function trigger_escape()
  local osascript = [[osascript -e '
     -- tell application "System Events" to tell front process
        -- key code 53
        display dialog 'HELLO'
     -- end tell
  ']]
  os.execute(osascript)
end

local function jk2esc_translator(key, env)
  local engine = env.engine
  local context = engine.context

  if context.input == "j" and key:repr() == "k" then
    context:clear()
    trigger_escape()
    return 1
  end
  return 2
end

return jk2esc_translator
