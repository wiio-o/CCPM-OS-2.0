-- Program Manager (CCPM-OS)

local progman = {}

local groups = {
    {
        name = "Main",
        items = {
            { name = "File Manager", path = "system/fileman.lua" },
            { name = "Control Panel", path = "system/control.lua" }
        }
    },
    {
        name = "Accessories",
        items = {
            { name = "Notepad", path = "accessories/notepad.lua" },
            { name = "Calculator", path = "accessories/calculator.lua" }
        }
    },
    {
        name = "Games",
        items = {
            { name = "Solitaire", path = "games/solitaire.lua" }
        }
    }
}

local selectedGroup = 1

-- =========================
-- INIT
-- =========================
function progman.init()
while true do
    progman.draw()
    progman.handleEvents()
    end
    end

    -- =========================
    -- DRAW PROGRAM MANAGER
    -- =========================
    function progman.draw()
    term.setBackgroundColor(colors.cyan)
    term.clear()

    -- window frame
    term.setBackgroundColor(colors.lightGray)
    term.setTextColor(colors.black)

    -- title
    term.setCursorPos(2, 1)
    term.write("Program Manager")

    -- group list (left side)
    local y = 3
    for i, g in ipairs(groups) do
        term.setCursorPos(2, y)

        if i == selectedGroup then
            term.setTextColor(colors.blue)
            else
                term.setTextColor(colors.black)
                end

                term.write(g.name)
                y = y + 1
                end

                -- items (right side)
                local items = groups[selectedGroup].items
                local iy = 3

                for _, item in ipairs(items) do
                    term.setCursorPos(20, iy)
                    term.setTextColor(colors.black)
                    term.write(item.name)
                    iy = iy + 1
                    end
                    end

                    -- =========================
                    -- INPUT
                    -- =========================
                    function progman.handleEvents()
                    local e = { os.pullEvent() }

                    if e[1] == "mouse_click" then
                        local x, y = e[3], e[4]

                        -- select group (left column)
                        local gy = 3
                        for i, _ in ipairs(groups) do
                            if x >= 2 and x <= 15 and y == gy then
                                selectedGroup = i
                                end
                                gy = gy + 1
                                end

                                -- launch app (right column)
                                local items = groups[selectedGroup].items
                                local iy = 3

                                for _, item in ipairs(items) do
                                    if x >= 20 and y == iy then
                                        shell.run(item.path)
                                        end
                                        iy = iy + 1
                                        end
                                        end
                                        end

                                        return progman
