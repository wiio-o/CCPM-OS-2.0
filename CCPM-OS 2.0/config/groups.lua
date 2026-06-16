-- CCPM-OS Program Manager Groups

return {
    {
        name = "Main",
        items = {
            { name = "File Manager", path = "system/fileman.lua" },
            { name = "Control Panel", path = "system/control.lua" },
            { name = "About CCPM-OS", path = "system/about.lua" }
        }
    },

    {
        name = "Accessories",
        items = {
            { name = "Notepad", path = "accessories/notepad.lua" },
            { name = "Calculator", path = "accessories/calculator.lua" },
            { name = "Paint", path = "accessories/paint.lua" },
            { name = "Clock", path = "accessories/clock.lua" }
        }
    },

    {
        name = "Games",
        items = {
            { name = "Minesweeper", path = "games/minesweeper.lua" }
        }
    }
}
