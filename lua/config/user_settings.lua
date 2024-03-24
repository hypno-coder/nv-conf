local function getEnv()
    local env = {}
    for line in io.lines("/Users/arturdavidov/.config/nvim/.env") do
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
