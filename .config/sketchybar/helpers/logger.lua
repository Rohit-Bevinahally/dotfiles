local M = {}
function M.tableToString(tbl)
    local result = {}
    for k, v in pairs(tbl) do
        local key = tostring(k)
        local value = tostring(v)
        if type(v) == "table" then
            value = tableToString(v)  -- Recursively handle nested tables
        end
        table.insert(result, key .. " = " .. value)
    end
    return "{" .. table.concat(result, ", ") .. "}"
end

function M.Log(msg)
    local file = io.open("/Users/rohitb/.config/sketchybar/General.log", "a")
    if file == nil then
        return
    end
    if msg == nil then
        file:write("Nothing to log\n")
        file:close()
        return
    end
    file:write(msg .. "\n")
    file:close()
end

return M
