local json = require "cjson"
local template = require "resty.template"
local requests = require "resty.requests"

local routesFile = io.open(ngx.config.prefix() .. "routes.json", "r")
local routesContent = routesFile:read("*all")
local routesTable = json.decode(routesContent)

local r, err = requests.get("http://vulcano.shadowmods.net/fetch")
if not r then
    ngx.log(ngx.ERR, err)
    local jsonFile = io.open(ngx.config.prefix() .. "packagesList.json", "r")
    local jsonContent = jsonFile:read("*all")

    local packagesList = json.decode(jsonContent)

    template.render("pages/packages.html", {packages = packagesList, routes = routesTable})
    return
end
local packagesList = json.decode(r)
template.render("pages/packages.html", {packages = packagesList, routes = routesTable})
