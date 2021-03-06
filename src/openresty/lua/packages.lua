local json = require "cjson"
local template = require "resty.template"

local routesFile = io.open(ngx.config.prefix() .. "routes.json", "r")
local routesContent = routesFile:read("*all")
local routesTable = json.decode(routesContent)
template.render("pages/packages.html", {packages = LatestPackages, routes = routesTable})
