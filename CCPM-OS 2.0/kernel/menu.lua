local menu = {}

menu.menus = {}

menu.openMenu = nil

-- =========================
-- DEFINE MENU BAR
-- =========================
function menu.set(items)
-- items format:
-- { {name="File", items={...}}, ... }
menu.menus = items
end

-- =========================
-- DRAW MENU BAR
-- =========================
function menu.draw()
term.setBackgroundColor(colors.lightGray)
term.setTextColor(colors.black)

local x = 1
local y = 1

for _, m in ipairs(menu.menus) do
    term.setCursorPos(x, y)
    term.write(" " .. m.name .. " ")

    x = x + #m.name + 2
    end

    -- draw dropdown if open
    if menu.openMenu then
        menu.drawDropdown(menu.openMenu)
        end
        end

        -- =========================
        -- DRAW DROPDOWN
        -- =========================
        function menu.drawDropdown(m)
        local x = m.x
        local y = 2

        term.setBackgroundColor(colors.white)
        term.setTextColor(colors.black)

        for i, item in ipairs(m.items) do
            term.setCursorPos(x, y + i - 1)
            term.write(" " .. item.name .. string.rep(" ", 10))
            end
            end

            -- =========================
            -- HANDLE CLICK
            -- =========================
            function menu.handleClick(x, y)
            -- top bar click
            if y == 1 then
                local pos = 1

                for _, m in ipairs(menu.menus) do
                    local startX = pos
                    local endX = pos + #m.name + 1

                    if x >= startX and x <= endX then
                        menu.openMenu = {
                            name = m.name,
                            items = m.items,
                            x = startX
                        }
                        return
                        end

                        pos = endX + 1
                        end

                        menu.openMenu = nil
                        return
                        end

                        -- dropdown click (basic placeholder)
                        menu.openMenu = nil
                        end

                        return menu
