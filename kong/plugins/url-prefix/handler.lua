local BasePlugin = require "kong.plugins.base_plugin"
local access = require "kong.plugins.url-prefix.access"


local UrlPrefix = BasePlugin:extend()

UrlPrefix.VERSION  = "1.0.0"
UrlPrefix.PRIORITY = 810

function UrlPrefix:new()
    UrlPrefix.super.new(self, "url-prefix")
end

function UrlPrefix:access(config)
    UrlPrefix.super.access(self)
    access.execute(config)
end

return UrlPrefix
