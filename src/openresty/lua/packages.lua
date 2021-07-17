local json = require "cjson"
local template = require "resty.template"

local jsonFile = io.open(ngx.config.prefix() .. "packagesList.json", "r")
local jsonContent = jsonFile:read("*all")

local packagesList = json.decode(jsonContent)

template.render("pages/packages.html", {
    packages = packagesList
})