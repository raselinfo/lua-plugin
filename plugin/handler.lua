-- custom-auth-plugin.lua

local BasePlugin = require "kong.plugins.base_plugin"
local http = require "resty.http"

local CustomAuthPlugin = BasePlugin:extend()

function CustomAuthPlugin:new()
  CustomAuthPlugin.super.new(self, "custom-auth-plugin")
end

function CustomAuthPlugin:access(config)
  CustomAuthPlugin.super.access(self)

  local token = ngx.req.get_headers()["Authorization"]

  if not token then
    return kong.response.exit(401, { message = "Unauthorized. Missing token." })
  end

  local httpc = http.new()
  local res, err = httpc:request_uri("http://your-auth-service-url", {
    method = "POST",
    headers = {
      ["Content-Type"] = "application/json",
      ["Authorization"] = token
    }
  })

  if not res or res.status ~= 200 then
    return kong.response.exit(401, { message = "Unauthorized. Invalid token.", details = err })
  end
end

return CustomAuthPlugin
