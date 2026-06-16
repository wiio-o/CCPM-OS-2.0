-- CCPM-OS Minesweeper

local w, h = 10, 10
local minesCount = 10

local grid = {}
local revealed = {}
local flagged = {}

local gameOver = false

-- =========================
-- INIT GRID
-- =========================
local function init()
grid = {}
revealed = {}
flagged = {}

for y = 1, h do
    grid[y] = {}
    revealed[y] = {}
    flagged[y] = {}

    for x = 1, w do
        grid[y][x] = 0
        revealed[y][x] = false
        flagged[y][x] = false
        end
        end

        -- place mines
        local placed = 0

        while placed < minesCount do
            local x = math.random(1, w)
            local y = math.random(1, h)

            if grid[y][x] ~= -1 then
                grid[y][x] = -1
                placed = placed + 1
                end
                end

                -- calculate numbers
                for y = 1, h do
                    for x = 1, w do
                        if grid[y][x] ~= -1 then
                            local count = 0

                            for dy = -1, 1 do
                                for dx = -1, 1 do
                                    local ny, nx = y + dy, x + dx

                                    if grid[ny] and grid[ny][nx] == -1 then
                                        count = count + 1
                                        end
                                        end
                                        end

                                        grid[y][x] = count
                                        end
                                        end
                                        end

                                        gameOver = false
                                        end

                                        -- =========================
                                        -- DRAW
                                        -- =========================
                                        local function draw()
                                        term.setBackgroundColor(colors.green)
                                        term.clear()

                                        term.setCursorPos(1, 1)
                                        term.setTextColor(colors.black)
                                        print("Minesweeper - Click to play | R = reset | Q = quit")

                                        for y = 1, h do
                                            for x = 1, w do
                                                term.setCursorPos(x * 2, y + 2)

                                                if flagged[y][x] then
                                                    term.write("F")

                                                    elseif not revealed[y][x] then
                                                        term.write("■")

                                                        elseif grid[y][x] == -1 then
                                                            term.write("*")

                                                            elseif grid[y][x] == 0 then
                                                                term.write(" ")

                                                                else
                                                                    term.write(tostring(grid[y][x]))
                                                                    end
                                                                    end
                                                                    end
                                                                    end

                                                                    -- =========================
                                                                    -- REVEAL TILE
                                                                    -- =========================
                                                                    local function reveal(x, y)
                                                                    if x < 1 or y < 1 or x > w or y > h then return end
                                                                        if revealed[y][x] or flagged[y][x] then return end

                                                                            revealed[y][x] = true

                                                                            if grid[y][x] == -1 then
                                                                                gameOver = true
                                                                                return
                                                                                end

                                                                                if grid[y][x] == 0 then
                                                                                    for dy = -1, 1 do
                                                                                        for dx = -1, 1 do
                                                                                            reveal(x + dx, y + dy)
                                                                                            end
                                                                                            end
                                                                                            end
                                                                                            end

                                                                                            -- =========================
                                                                                            -- INPUT
                                                                                            -- =========================
                                                                                            local function run()
                                                                                            init()

                                                                                            while true do
                                                                                                draw()

                                                                                                if gameOver then
                                                                                                    term.setCursorPos(1, 15)
                                                                                                    print("GAME OVER! Press R to restart")
                                                                                                    end

                                                                                                    local e = { os.pullEvent() }

                                                                                                    if e[1] == "mouse_click" then
                                                                                                        local button = e[2]
                                                                                                        local x = math.floor(e[3] / 2)
                                                                                                        local y = e[4] - 2

                                                                                                        if y >= 1 and y <= h and x >= 1 and x <= w then
                                                                                                            if button == 1 then
                                                                                                                reveal(x, y)

                                                                                                                elseif button == 2 then
                                                                                                                    flagged[y][x] = not flagged[y][x]
                                                                                                                    end
                                                                                                                    end

                                                                                                                    elseif e[1] == "key" then
                                                                                                                        local k = e[2]

                                                                                                                        if k == keys.r then
                                                                                                                            init()

                                                                                                                            elseif k == keys.q then
                                                                                                                                break
                                                                                                                                end
                                                                                                                                end
                                                                                                                                end

                                                                                                                                term.setBackgroundColor(colors.black)
                                                                                                                                term.clear()
                                                                                                                                end

                                                                                                                                run()
