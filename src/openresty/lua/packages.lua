local json = require "cjson"
local template = require "resty.template"

local jsonFile = io.open(ngx.config.prefix() .. "packagesList.json", "r")
local jsonContent = jsonFile:read("*all")

local packagesList = json.decode(jsonContent)

local routesFile = io.open(ngx.config.prefix() .. "routes.json", "r")
local routesContent = routesFile:read("*all")
local routesTable = json.decode(routesContent)

template.render("pages/packages.html", {
    packages = packagesList, routes = routesTable
})