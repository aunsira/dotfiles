-- https://github.com/asmagill/hs._asm.undocumented.spaces
local spaces = require('hs._asm.undocumented.spaces')

-- Switch alacritty
hs.hotkey.bind({'alt','shift','ctrl'}, 'j', function ()
  local APP_NAME = 'Alacritty'
  function moveWindow(alacritty, space, mainScreen)
    -- move to main space
    local win = nil
    while win == nil do
      win = alacritty:mainWindow()
    end
    print(win)
    print(space)
    print(win:screen())
    print(mainScreen)
    local fullScreen = not win:isStandard()
    if fullScreen then
      hs.eventtap.keyStroke('cmd', 'return', 0, alacritty)
    end
    winFrame = win:frame()
    scrFrame = mainScreen:fullFrame()
    print(winFrame)
    print(scrFrame)
    winFrame.w = scrFrame.w
    winFrame.y = scrFrame.y
    winFrame.x = scrFrame.x
    print(winFrame)
    win:setFrame(winFrame, 0)
    print(win:frame())
    win:spacesMoveTo(space)
    if fullScreen then
      hs.eventtap.keyStroke('cmd', 'return', 0, alacritty)
    end
    win:focus()
  end
  local alacritty = hs.application.get(APP_NAME)
  if alacritty ~= nil and alacritty:isFrontmost() then
    alacritty:hide()
  else
    local space = spaces.activeSpace()
    local mainScreen = hs.screen.find(spaces.mainScreenUUID())
    if alacritty == nil and hs.application.launchOrFocus(APP_NAME) then
      local appWatcher = nil
      print('create app watcher')
      appWatcher = hs.application.watcher.new(function(name, event, app)
        print(name)
        print(event)
        if event == hs.application.watcher.launched and name == APP_NAME then
          app:hide()
          moveWindow(app, space, mainScreen)
          appWatcher:stop()
        end
      end)
      print('start watcher')
      appWatcher:start()
    end
    if alacritty ~= nil then
      moveWindow(alacritty, space, mainScreen)
    end
  end
end)

-- Hide alacritty if not in focus
hs.window.filter.default:subscribe(hs.window.filter.windowFocused, function(window, appName)
  local alacritty = hs.application.get('Alacritty')
  if alacritty ~= nil then
     alacritty:hide()
  end
end)
