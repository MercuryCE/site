local json = require "cjson"
LatestPackages = {}

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