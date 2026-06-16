WINDOWS = WINDOWS or {}

local window = {}

-- =========================
-- CREATE WINDOW
-- =========================
function window.create(title, x, y, w, h)
local win = {
    title = title or "Window",
    x = x or 1,
    y = y or 1,
    w = w or 20,
    h = h or 10,
    active = false,
    visible = true
}

table.insert(WINDOWS, win)

window.focus(win)

return win
end

-- =========================
-- FOCUS WINDOW (bring to front)
-- =========================
function window.focus(target)
if not target then return end

    for _, w in ipairs(WINDOWS) do
        w.active = false
        end

        target.active = true

        -- move to top of stack
        for i, w in ipairs(WINDOWS) do
            if w == target then
                table.remove(WINDOWS, i)
                table.insert(WINDOWS, w)
                break
                end
                end
                end

                -- =========================
                -- HIT TEST (for mouse later)
                -- =========================
                function window.isInside(win, x, y)
                return x >= win.x and x <= win.x + win.w - 1 and
                y >= win.y and y <= win.y + win.h - 1
                end

                -- =========================
                -- DRAW SINGLE WINDOW
                -- =========================
                function window.draw(win)
                if not win.visible then return end

                    -- colors
                    local bg = colors.lightGray
                    local titleBar = win.active and colors.blue or colors.gray
                    local text = colors.white

                    -- WINDOW BODY
                    term.setBackgroundColor(bg)
                    term.setTextColor(colors.black)

                    for y = win.y, win.y + win.h - 1 do
                        term.setCursorPos(win.x, y)
                        term.write(string.rep(" ", win.w))
                        end

                        -- 3D BORDER (Win 3.1 style simple bevel)
                        -- top/left highlight
                        term.setTextColor(colors.white)
                        term.setCursorPos(win.x, win.y)
                        term.write(string.rep(" ", win.w))

                        -- bottom/right shadow
                        term.setTextColor(colors.gray)
                        term.setCursorPos(win.x, win.y + win.h - 1)
                        term.write(string.rep(" ", win.w))

                        -- TITLE BAR
                        term.setBackgroundColor(titleBar)
                        term.setTextColor(text)

                        term.setCursorPos(win.x, win.y)
                        term.write(string.rep(" ", win.w))

                        -- title text
                        term.setCursorPos(win.x + 1, win.y)
                        term.write(string.sub(win.title, 1, win.w - 4))

                        -- close button
                        term.setCursorPos(win.x + win.w - 2, win.y)
                        term.write("X")
                        end

                        -- =========================
                        -- DRAW ALL WINDOWS (back to front)
                        -- =========================
                        function window.drawAll()
                        for _, win in ipairs(WINDOWS) do
                            window.draw(win)
                            end
                            end

                            return window
