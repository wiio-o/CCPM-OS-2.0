-- CCPM-OS Notepad

local text = {}

function draw()
term.setBackgroundColor(colors.white)
term.setTextColor(colors.black)
term.clear()

term.setCursorPos(1, 1)
print("Notepad - type something (Ctrl+S to save, Ctrl+Q to quit)")
print("--------------------------------------------------------")

for i, line in ipairs(text) do
    print(line)
    end
    end

    function run()
    while true do
        draw()

        local e = { os.pullEvent() }

        if e[1] == "char" then
            text[#text + 1] = (text[#text] or "") .. e[2]

            elseif e[1] == "key" then
                local key = e[2]

                -- Ctrl+Q (quit)
                if key == keys.q and keys.ctrl then
                    break
                    end

                    -- Ctrl+S (save simple file)
                    if key == keys.s and keys.ctrl then
                        local f = fs.open("data/note.txt", "w")
                        for _, l in ipairs(text) do
                            f.writeLine(l)
                            end
                            f.close()
                            end

                            elseif e[1] == "key" and e[2] == keys.backspace then
                                local last = text[#text] or ""
                                text[#text] = string.sub(last, 1, #last - 1)
                                end
                                end

                                term.setBackgroundColor(colors.black)
                                term.clear()
                                end

                                run()
