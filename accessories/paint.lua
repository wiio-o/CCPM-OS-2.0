-- CCPM-OS Paint

local w, h = term.getSize()

local canvas = {}
local cursorX, cursorY = 2, 2
local drawColor = colors.black

-- =========================
-- INIT CANVAS
-- =========================
local function initCanvas()
for y = 1, h do
    canvas[y] = {}
    for x = 1, w do
        canvas[y][x] = " "
        end
        end
        end

        -- =========================
        -- DRAW SCREEN
        -- =========================
        local function draw()
        term.setBackgroundColor(colors.white)
        term.clear()

        for y = 1, h do
            term.setCursorPos(1, y)

            for x = 1, w do
                term.setTextColor(drawColor)
                term.write(canvas[y][x])
                end
                end

                -- cursor
                term.setCursorPos(cursorX, cursorY)
                term.setTextColor(colors.red)
                term.write("X")

                -- UI hint
                term.setCursorPos(1, 1)
                term.setTextColor(colors.black)
                term.write("PAINT - Arrows move | Space draw | C clear | Q quit")
                end

                -- =========================
                -- DRAW PIXEL
                -- =========================
                local function paint()
                canvas[cursorY][cursorX] = "#"
                end

                -- =========================
                -- RUN LOOP
                -- =========================
                local function run()
                initCanvas()

                while true do
                    draw()

                    local e = { os.pullEvent() }

                    if e[1] == "key" then
                        local k = e[2]

                        if k == keys.up and cursorY > 2 then
                            cursorY = cursorY - 1

                            elseif k == keys.down and cursorY < h then
                                cursorY = cursorY + 1

                                elseif k == keys.left and cursorX > 1 then
                                    cursorX = cursorX - 1

                                    elseif k == keys.right and cursorX < w then
                                        cursorX = cursorX + 1

                                        elseif k == keys.space then
                                            paint()

                                            elseif k == keys.c then
                                                initCanvas()

                                                elseif k == keys.q then
                                                    break
                                                    end
                                                    end
                                                    end

                                                    term.setBackgroundColor(colors.black)
                                                    term.clear()
                                                    end

                                                    run()
