-- CCPM-OS Startup

term.setBackgroundColor(colors.black)
term.setTextColor(colors.white)
term.clear()
term.setCursorPos(1, 1)

print("CCPM-OS")
print("Initializing...")

-- Load APIs
os.loadAPI("kernel/window")
os.loadAPI("kernel/desktop")

print("Done.")

sleep(0.5)

-- Start the desktop environment
desktop.run()
