-- CCPM-OS File Manager

local fileman = {}

local path = "data"
local files = {}
local selected = 1

-- =========================
-- LOAD DIRECTORY
-- =========================
local function loadDir(p)
files = fs.list(p)
path = p
selected = 1
end

-- =========================
-- INIT
-- =========================
function fileman.init()
loadDir("data")

while true do
    fileman.draw()
    fileman.handleEvents()
    end
    end

    -- =========================
    -- DRAW UI
    -- =========================
    function fileman.draw()
    term.setBackgroundColor(colors.cyan)
    term.clear()

    -- window frame
    term.setBackgroundColor(colors.lightGray)
    term.setTextColor(colors.black)

    term.setCursorPos(2, 1)
    term.write("File Manager - " .. path)

    -- file list
    local y = 3

    for i, f in ipairs(files) do
        term.setCursorPos(2, y)

        if i == selected then
            term.setTextColor(colors.blue)
            else
                term.setTextColor(colors.black)
                end

                term.write(f)
                y = y + 1
                end
                end

                -- =========================
                -- OPEN FILE OR FOLDER
                -- =========================
                local function openItem(name)
                local full = fs.combine(path, name)

                if fs.isDir(full) then
                    loadDir(full)
                    else
                        -- simple text viewer
                        local f = fs.open(full, "r")
                        if not f then return end

                            term.setBackgroundColor(colors.black)
                            term.setTextColor(colors.white)
                            term.clear()
                            term.setCursorPos(1, 1)

                            local content = f.readAll()
                            f.close()

                            print(content or "")

                            print("\nPress any key to return...")
                            os.pullEvent("key")
                            end
                            end

                            -- =========================
                            -- INPUT HANDLING
                            -- =========================
                            function fileman.handleEvents()
                            local e = { os.pullEvent() }

                            if e[1] == "mouse_click" then
                                local x, y = e[3], e[4]

                                local fy = 3

                                for i, f in ipairs(files) do
                                    if y == fy then
                                        selected = i
                                        openItem(f)
                                        return
                                        end
                                        fy = fy + 1
                                        end
                                        end
                                        end

                                        return fileman
