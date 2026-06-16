-- CCPM-OS Desktop Core

local desktop = {}

local windows = {}

-- =========================
-- WINDOW MANAGEMENT
-- =========================

function desktop.add(win)
    table.insert(windows, win)
end

function desktop.getWindows()
    return windows
end

function desktop.focusWindow(index)
    local win = windows[index]
    if not win then return end

    table.remove(windows, index)
    table.insert(windows, win)
end

-- =========================
-- DRAW SYSTEM
-- =========================

function desktop.draw(windowLib)
    -- background
    if windowLib and windowLib.drawDesktopBackground then
        windowLib.drawDesktopBackground()
    else
        term.setBackgroundColor(colors.black)
        term.clear()
    end

    -- windows
    for i = 1, #windows do
        local w = windows[i]
        if w and w.draw then
            w.draw()
        end
    end

    -- taskbar
    if windowLib and windowLib.drawTaskbar then
        windowLib.drawTaskbar(windows)
    else
        term.setCursorPos(1, 1)
        term.setBackgroundColor(colors.gray)
        term.write(" CCPM-OS ")
    end
end

-- =========================
-- MAIN LOOP (THIS WAS MISSING)
-- =========================

function desktop.run(windowLib, events, menu, appmanager)
    while true do
        desktop.draw(windowLib)

        local e = { os.pullEvent() }
        local name = e[1]

        -- event handler
        if events and events.handle then
            events.handle(e, windows)
        end

        -- menu handler
        if menu and menu.handle then
            menu.handle(e, windows)
        end

        -- optional exit key (Ctrl+Q style fallback)
        if name == "key" and e[2] == keys.q then
            break
        end
    end
end

return desktop
