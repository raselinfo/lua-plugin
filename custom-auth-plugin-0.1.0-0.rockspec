-- custom-auth-plugin-0.1.0-0.rockspec

package = "custom-auth-plugin"
version = "0.1.0-0"  -- Replace with the actual version number
source = {
   url = "git://github.com/your-username/your-repo.git",
   tag = "v0.1.0"  -- Replace with the actual version number
}

description = {
   summary = "Custom Kong authentication plugin",
   detailed = [[
      This is a custom Kong plugin for authentication.
   ]],
   license = "MIT",
}

dependencies = {
   "lua >= 5.1, < 5.4",
   "kong >= 2.0.0, < 3.0.0", -- Adjust the Kong version based on compatibility
}

build = {
   type = "builtin",
   modules = {
    ["kong.plugins.custom-auth-plugin.handler"] = "custom-auth-plugin/handler.lua",
    ["kong.plugins.custom-auth-plugin.schema"] = "custom-auth-plugin/schema.lua",
  }
}
