-- CCPM-OS Installer
-- Repo: https://github.com/wiio-o/CCPM-OS-2.0

local base = "https://raw.githubusercontent.com/wiio-o/CCPM-OS-2.0/main/"

local files = {
    "startup.lua",

    -- kernel
    "kernel/window.lua",
    "kernel/desktop.lua",
    "kernel/events.lua",
    "kernel/menu.lua",
    "kernel/appmanager.lua",

    -- system
    "system/progman.lua",
    "system/fileman.lua",
    "system/control.lua",
    "system/about.lua",

    -- accessories
    "accessories/notepad.lua",
    "accessories/calculator.lua",
    "accessories/paint.lua",
    "accessories/clock.lua",

    -- games
    "games/minesweeper.lua",

    -- config
    "config/groups.lua",
    "config/settings.lua",

    -- lib
    "lib/utils.lua",
    "lib/graphics.lua"
}

-- =========================
-- CREATE DIRECTORIES
-- =========================
local function ensureDir(path)
local parts = {}
for part in string.gmatch(path, "[^/]+") do
    table.insert(parts, part)
    end

    -- remove file name
    table.remove(parts)

    local current = ""

    for _, p in ipairs(parts) do
        current = current .. p .. "/"
        if not fs.exists(current) then
            fs.makeDir(current)
            end
            end
            end

            -- =========================
            -- DOWNLOAD FILE
            -- =========================
            local function download(file)
            local url = base .. file

            ensureDir(file)

            print("Downloading: " .. file)

            local response = http.get(url)

            if not response then
                print("FAILED: " .. file)
                return
                end

                local content = response.readAll()
                response.close()

                local f = fs.open(file, "w")
                f.write(content)
                f.close()
                end

                -- =========================
                -- MAIN INSTALL
                -- =========================
                term.setBackgroundColor(colors.black)
                term.setTextColor(colors.white)
                term.clear()
                term.setCursorPos(1, 1)

                print("================================")
                print("        CCPM-OS INSTALLER       ")
                print("================================")
                print("Repo: wiio-o/CCPM-OS-2.0")
                print("")

                if not http then
                    print("ERROR: HTTP is disabled.")
                    print("Enable http_enable in config.")
                    return
                    end

                    for i, file in ipairs(files) do
                        download(file)
                        end

                        print("")
                        print("================================")
                        print("INSTALL COMPLETE")
                        print("Run: startup")
                        print("================================")
