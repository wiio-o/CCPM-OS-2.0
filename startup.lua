-- CCPM-OS Startup (stable loader)

term.setBackgroundColor(colors.black)
term.setTextColor(colors.white)
term.clear()
term.setCursorPos(1,1)

-- Safe module loader
local function load(path)
    local ok, res = pcall(dofile, path)
    if not ok then
        error("Failed to load module:\n" .. path .. "\n\n" .. tostring(res))
    end
    return res
end

-- =========================
-- LOAD KERNEL MODULES
-- =========================
local window = load("kernel/window.lua")
local desktop = load("kernel/desktop.lua")
local events = load("kernel/events.lua")
local menu = load("kernel/menu.lua")
local appmanager = load("kernel/appmanager.lua")

-- =========================
-- INIT DESKTOP STATE
-- =========================
if desktop.init then
    desktop.init(window)
end

if appmanager.init then
    appmanager.init(window, desktop)
end

-- =========================
-- START SYSTEM LOOP
-- =========================
desktop.run(window, events, menu, appmanager)
