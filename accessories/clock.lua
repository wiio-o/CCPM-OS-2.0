-- CCPM-OS Clock

local function draw()
term.setBackgroundColor(colors.cyan)
term.clear()

term.setCursorPos(2, 2)
term.setTextColor(colors.black)

print("Clock")
print("-----")

while true do
    term.setCursorPos(2, 5)
    term.write(textutils.formatTime(os.time(), true) .. "      ")

    sleep(1)
    end
    end

    draw()
