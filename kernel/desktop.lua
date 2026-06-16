local desktop = {}

function desktop.run()
-- test window (Program Manager placeholder)
local progman = window.create("Program Manager", 3, 3, 30, 12)
window.focus(progman)

-- menu setup (Windows 3.1 style)
menu.set({
    {
        name = "File",
        items = {
            { name = "Open" },
         { name = "Exit" }
        }
    },
    {
        name = "Help",
         items = {
             { name = "About" }
         }
    }
})

while true do
    desktop.draw()

    events.handle()
    end
    end

    -- =========================
    -- DRAW EVERYTHING
    -- =========================
    function desktop.draw()
    -- background
    term.setBackgroundColor(colors.cyan)
    term.clear()

    -- menu bar
    menu.draw()

    -- windows
    window.drawAll()
    end

    -- =========================
    -- INPUT HANDLING
    -- =========================

    events.onMouseDown = function(button, x, y)
    -- first: menu click
    menu.handleClick(x, y)

    -- second: window focus
    for _, win in ipairs(WINDOWS) do
        if window.isInside(win, x, y) then
            window.focus(win)
            break
            end
            end
            end

            events.onMouseDrag = function(button, x, y)
            -- (dragging will be added later)
            end

            events.onMouseUp = function(button, x, y)
            -- currently unused
            end

            events.onMouseScroll = function(dir, x, y)
            -- unused for now
            end

            return desktop
