-- CCPM-OS Graphics Helpers

local gfx = {}

-- =========================
-- DRAW FILLED BOX
-- =========================
function gfx.box(x, y, w, h, bg)
term.setBackgroundColor(bg)

for i = 0, h - 1 do
    term.setCursorPos(x, y + i)
    term.write(string.rep(" ", w))
    end
    end

    -- =========================
    -- DRAW WINDOW FRAME (simple 3D style)
    -- =========================
    function gfx.window(x, y, w, h, bg, titleBar, active)
    -- body
    gfx.box(x, y, w, h, bg)

    -- title bar
    gfx.box(x, y, w, 1, active and titleBar or colors.gray)

    -- border highlight (left/top)
    term.setTextColor(colors.white)
    term.setCursorPos(x, y)
    term.write(string.rep(" ", w))

    -- border shadow (bottom)
    term.setTextColor(colors.gray)
    term.setCursorPos(x, y + h - 1)
    term.write(string.rep(" ", w))
    end

    return gfx
