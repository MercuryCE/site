local template = require "resty.template"

template.render(([[<!DOCTYPE html>
<html lang="en">
  <head>
    {(components/header.html)}
  </head>
  <body>
    <div id="page-wrapper">
      {(components/navbar.html)}
      <div class="uk-padding"></div>
      <div class="uk-container">{(docs%s.html)}</div>
       <div class="uk-padding"></div>
    </div>
  </body>
  {(components/footer.html)}
</html>
]]):format(ngx.var.uri))