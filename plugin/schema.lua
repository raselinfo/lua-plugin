-- schema.lua

local typedefs = require "kong.db.schema.typedefs"

return {
  name = "custom-auth-plugin",
  fields = {
    { protocols = typedefs.protocols_http },
    { config = {
        type = "record",
        fields = {
          { api_key = { type = "string", required = true, default = "your_default_api_key" } },
          -- Add any other configuration fields as needed
        },
      },
    },
  },
}
