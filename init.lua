
area_effects = {
  -- local data
  -- id -> {}
  area_data = {},

  -- key => description
  effects = {}
}

local MP = minetest.get_modpath("area_effects")

dofile(MP.."/effects.lua")
dofile(MP.."/storage.lua")
dofile(MP.."/accessors.lua")
dofile(MP.."/transition.lua")
dofile(MP.."/hooks.lua")
dofile(MP.."/log.lua")

if minetest.get_modpath("epic_skybox") then
  dofile(MP.."/integrations/epic_skybox.lua")
end

if minetest.get_modpath("epic_weather") then
  dofile(MP.."/integrations/epic_weather.lua")
end

dofile(MP.."/integrations/day_night.lua")
dofile(MP.."/integrations/no_clouds.lua")
