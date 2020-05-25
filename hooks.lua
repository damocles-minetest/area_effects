
local hooks = {}

area_effects.register_hook = function(hook)
  table.insert(hooks, hook)
end


area_effects.run_hook = function(name, params)
  for _, hook in ipairs(hooks) do
    local fn = hook[name]
    if fn and type(fn) == "function" then
      fn( unpack(params) )
    end
  end
end
