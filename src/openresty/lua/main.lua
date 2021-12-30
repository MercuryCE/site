local json = require "cjson"
LatestPackages = {}

function TableLength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end

ngx.log(ngx.DEBUG, "Fetching latest packages...")
local pipe = io.popen("curl -q http://vulcano.shadowmods.net/v1/fetch")
if (pipe) then
    local r = pipe:read("a*")
    if (r and r ~= "") then
        LatestPackages = json.decode(r)
        ngx.log(ngx.DEBUG, "Success.")
    end
    pipe:close()
end