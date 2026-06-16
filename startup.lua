-- CCPM-OS Startup
-- Module loader (replaces os.loadAPI)

local function loadModule(path)
    local ok, result = pcall(dofile, path)
    if not ok then
        error("Failed to load module: " .. path .. "\n" .. tostring(result))
    end
    return result
end

-- =========================
-- LOAD CORE KERNEL MODULES
-- =========================
local window = loadModule("kernel/window.lua")
local desktop = loadModule("kernel/desktop.lua")
local events = loadModule("kernel/events.lua")
local menu = loadModule("kernel/menu.lua")
local appmanager = loadModule("kernel/appmanager.lua")

-- =========================
-- INIT SYSTEM (if supported)
-- =========================
if appmanager and appmanager.init then
    appmanager.init()
end

-- =========================
-- START DESKTOP LOOP
-- =========================
if desktop and desktop.run then
    desktop.run(window, events, menu, appmanager)
else
    error("Desktop module missing run() function")
end
