local get_path = kong.request.get_path
local set_path = kong.service.request.set_path

local _M = {}

local function is_empty(s)
  return s == nil or s == ''
end

local function ltrim(str, trim_str)
  if string.find(str, trim_str) == 1 then
      return str:sub(string.len(trim_str)+1)
  else
      return str
  end
end

function _M.execute(conf)
  if not is_empty(conf.prefix) then
      set_path(ltrim(get_path(), conf.prefix))
  end
end

return _M
