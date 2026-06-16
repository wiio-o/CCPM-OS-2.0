local appmanager = {}

appmanager.apps = {}

-- =========================
-- REGISTER APP
-- =========================
function appmanager.register(name, path)
appmanager.apps[name] = {
    name = name,
    path = path
}
end

-- =========================
-- LIST APPS
-- =========================
function appmanager.list()
local list = {}

for name, app in pairs(appmanager.apps) do
    table.insert(list, app)
    end

    return list
    end

    -- =========================
    -- LAUNCH APP
    -- =========================
    function appmanager.launch(name)
    local app = appmanager.apps[name]

    if not app then
        print("App not found: " .. tostring(name))
        return false
        end

        if fs.exists(app.path) then
            shell.run(app.path)
            return true
            else
                print("Missing file: " .. app.path)
                return false
                end
                end

                -- =========================
                -- LAUNCH BY PATH
                -- =========================
                function appmanager.launchPath(path)
                if fs.exists(path) then
                    shell.run(path)
                    return true
                    end

                    print("Missing file: " .. path)
                    return false
                    end

                    return appmanager
