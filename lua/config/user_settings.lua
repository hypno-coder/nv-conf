local function getEnv()
    local env = {}
    local script_dir = debug.getinfo(1, "S").source:match("@(.*/)")
    local path = script_dir ..".env"
    for line in io.lines(path) do
        local key, value = line:match("^%s*(.-)%s*=%s*(.-)%s*$")
        if key and value then
            env[key] = value
        end
    end
    return env
end

return {
    env = getEnv()
}
