-- CCPM-OS Control Panel

local control = {}

local selected = 1

local options = {
    "System Info",
    "Clear Screen",
    "Reboot",
    "Shutdown"
}

-- =========================
-- INIT
-- =========================
function control.init()
while true do
    control.draw()
    control.handleEvents()
    end
    end

    -- =========================
    -- DRAW UI
    -- =========================
    function control.draw()
    term.setBackgroundColor(colors.cyan)
    term.clear()

    -- window header
    term.setBackgroundColor(colors.lightGray)
    term.setTextColor(colors.black)

    term.setCursorPos(2, 1)
    term.write("Control Panel")

    -- options list
    local y = 3

    for i, opt in ipairs(options) do
        term.setCursorPos(2, y)

        if i == selected then
            term.setTextColor(colors.blue)
            else
                term.setTextColor(colors.black)
                end

                term.write(opt)
                y = y + 1
                end
                end

                -- =========================
                -- ACTIONS
                -- =========================
                local function runOption(opt)
                if opt == "System Info" then
                    term.setBackgroundColor(colors.black)
                    term.setTextColor(colors.white)
                    term.clear()
                    term.setCursorPos(1, 1)

                    print("CCPM-OS Control Panel")
                    print("---------------------")
                    print("Lua Version: " .. _VERSION)
                    print("ComputerCraft OS")

                    print("\nPress any key to return...")
                    os.pullEvent("key")

                    elseif opt == "Clear Screen" then
                        term.clear()

                        elseif opt == "Reboot" then
                            os.reboot()

                            elseif opt == "Shutdown" then
                                os.shutdown()
                                end
                                end

                                -- =========================
                                -- INPUT
                                -- =========================
                                function control.handleEvents()
                                local e = { os.pullEvent() }

                                if e[1] == "mouse_click" then
                                    local x, y = e[3], e[4]

                                    local oy = 3

                                    for i, opt in ipairs(options) do
                                        if y == oy then
                                            selected = i
                                            runOption(opt)
                                            end
                                            oy = oy + 1
                                            end
                                            end
                                            end

                                            return control
