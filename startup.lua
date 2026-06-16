-- CCPM-OS Desktop (Windows 3.1 style core loop)

local desktop = {}

local windows = {}
local focusedWindow = nil

-- =========================
-- BASIC WINDOW MANAGEMENT
-- =========================

function desktop.addWindow(win)
    table.insert(windows, win)
    focusedWindow = win
end

function desktop.focusWindow(win)
    focusedWindow = win
end

function desktop.drawAll(windowLib)
    term.setBackgroundColor(colors.black)
    term.clear()

    -- draw desktop background
    if windowLib and windowLib.drawDesktopBackground then
        windowLib.drawDesktopBackground()
    end

    -- draw windows (back to front)
    for i = 1, #windows do
        local w = windows[i]
        if w and w.draw then
            w.draw()
        end
    end

    -- draw taskbar last
    if windowLib and windowLib.drawTaskbar then
        windowLib.drawTaskbar(windows, focusedWindow)
    end
end

-- =========================
-- MAIN EVENT LOOP
-- =========================

function desktop.run(windowLib, events, menu, appmanager)
    while true do
        desktop.drawAll(windowLib)

        local event = {os.pullEvent()}

        local name = event[1]

        -- pass events to handler system
        if events and events.handle then
            events.handle(event, windows, focusedWindow)
        end

        -- optional menu handling
        if menu and menu.handle then
            menu.handle(event, windows, focusedWindow)
        end

        -- simple close shortcut example
        if name == "key" and event[2] == keys.leftAlt then
            break
        end
    end
end

return desktop
