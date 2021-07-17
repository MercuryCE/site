local json = require "cjson"

local function canOpen(name, mode)
    local f = io.open(name, mode or 'rb')
    if f then f:close() end
    return f ~= nil and name or nil
end

local markdownPath = (ngx.config.prefix() .. "html" .. ngx.var.uri .. ".html")

local routesFile = io.open(ngx.config.prefix() .. "routes.json", "r")
local routesContent = routesFile:read("*all")
local routesTable = json.decode(routesContent)

if (canOpen(markdownPath)) then
    local template = require "resty.template"
    template.render(([[<!DOCTYPE html>
<html lang="en">
  <head>
    {(components/header.html)}
  </head>
  <body>
    {(components/sidebar.html, {routes = routes})}
    <div id="page-wrapper">
      {(components/navbar.html)}
      <div class="uk-container">{(%s.html)}</div>
       <div class="uk-padding"></div>
    </div>
  </body>
  {(components/footer.html)}
</html>
]]):format(ngx.var.uri), {routes = routesTable})
else
    ngx.redirect("/")
end
