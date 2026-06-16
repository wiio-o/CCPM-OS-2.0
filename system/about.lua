-- CCPM-OS About Dialog

local about = {}

-- =========================
-- INIT
-- =========================
function about.init()
term.setBackgroundColor(colors.cyan)
term.clear()

-- centered dialog box
local w, h = term.getSize()

local boxW = 30
local boxH = 10

local x = math.floor((w - boxW) / 2)
local y = math.floor((h - boxH) / 2)

-- draw window
term.setBackgroundColor(colors.lightGray)
term.setTextColor(colors.black)

for i = 0, boxH - 1 do
    term.setCursorPos(x, y + i)
    term.write(string.rep(" ", boxW))
    end

    -- title
    term.setBackgroundColor(colors.blue)
    term.setTextColor(colors.white)
    term.setCursorPos(x, y)
    term.write(string.rep(" ", boxW))

    term.setCursorPos(x + 2, y)
    term.write("About CCPM-OS")

    -- content
    term.setBackgroundColor(colors.lightGray)
    term.setTextColor(colors.black)

    term.setCursorPos(x + 2, y + 3)
    term.write("CCPM-OS Version 0.1")

    term.setCursorPos(x + 2, y + 4)
    term.write("Windows 3.1 Inspired Shell")

    term.setCursorPos(x + 2, y + 6)
    term.write("Built in ComputerCraft Lua")

    -- close hint
    term.setCursorPos(x + 2, y + 8)
    term.write("Press any key to close")

    os.pullEvent("key")
    end

    return about
