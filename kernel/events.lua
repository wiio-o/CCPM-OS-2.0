local events = {}

events.mouse = {
    down = false,
    button = nil,
    x = 0,
    y = 0,
    lastX = 0,
    lastY = 0
}

-- =========================
-- INTERNAL DISPATCH HELPERS
-- =========================
function events.handle()
local e = { os.pullEvent() }
local type = e[1]

if type == "mouse_click" then
    events.mouse.down = true
    events.mouse.button = e[2]
    events.mouse.x = e[3]
    events.mouse.y = e[4]

    events.onMouseDown(e[2], e[3], e[4])

    elseif type == "mouse_up" then
        events.mouse.down = false
        events.onMouseUp(e[2], e[3], e[4])

        elseif type == "mouse_drag" then
            events.mouse.lastX = events.mouse.x
            events.mouse.lastY = events.mouse.y
            events.mouse.x = e[3]
            events.mouse.y = e[4]

            events.onMouseDrag(e[2], e[3], e[4])

            elseif type == "mouse_scroll" then
                events.onMouseScroll(e[2], e[3], e[4])
                end
                end

                -- =========================
                -- CALLBACKS (override in desktop.lua)
                -- =========================
                function events.onMouseDown(button, x, y) end
                function events.onMouseUp(button, x, y) end
                function events.onMouseDrag(button, x, y) end
                function events.onMouseScroll(direction, x, y) end

                return events
