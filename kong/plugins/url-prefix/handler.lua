local BasePlugin = require "kong.plugins.base_plugin"
local get_path = kong.request.get_path
local set_path = kong.service.request.set_path

local UrlPrefix = BasePlugin:extend()

UrlPrefix.VERSION = "0.1.1"
UrlPrefix.PRIORITY = 810

local function is_empty(s)
    return s == nil or s == ''
end

local function ltrim(str, trim_str)
    if string.find(str, trim_str) == 1 then
        return str:sub(string.len(trim_str) + 1)
    else
        return str
    end
end

function UrlPrefix:new()
    UrlPrefix.super.new(self, "url-prefix")
end

function UrlPrefix:access(config)
    UrlPrefix.super.access(self)
    if not is_empty(config.prefix) then
        set_path(ltrim(get_path(), config.prefix))
    end
end

return UrlPrefix
