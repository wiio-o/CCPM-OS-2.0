-- CCPM-OS Calculator

local input = ""

local function draw()
term.setBackgroundColor(colors.lightGray)
term.setTextColor(colors.black)
term.clear()

term.setCursorPos(1, 1)
print("Calculator")
print("----------")

term.setCursorPos(1, 4)
print("Input: " .. input)

term.setCursorPos(1, 6)
print("Enter math (e.g. 2+2)")
print("Enter = calculate, C = clear")
end

local function run()
while true do
    draw()

    local e = { os.pullEvent() }

    if e[1] == "char" then
        input = input .. e[2]

        elseif e[1] == "key" then
            local k = e[2]

            if k == keys.enter then
                local fn = load("return " .. input)
                if fn then
                    local ok, result = pcall(fn)
                    input = tostring(result or "error")
                    else
                        input = "error"
                        end

                        elseif k == keys.c then
                            input = ""

                            elseif k == keys.backspace then
                                input = input:sub(1, -2)
                                end
                                end
                                end
                                end

                                run()
