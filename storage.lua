
-- area-based data service
-- stores data related to area-id's
-- use-case: area-based weather or effects

-- File writing / reading utilities
local wpath = minetest.get_worldpath()
local filename = wpath.."/area_effects.dat"


-- load data from disk
function area_effects.load()
	local f = io.open(filename, "r")
	if f == nil then return {} end
	local t = f:read("*all")
	f:close()
  if t ~= "" and t ~= nil then
    -- existing data found
    area_effects.area_data = minetest.deserialize(t)
  else
    -- no saved data yet
    area_effects.area_data = {}
  end
end

-- save data to disk
function area_effects.save()
	local f = io.open(filename, "w")
	f:write(minetest.serialize(area_effects.area_data))
	f:close()
end

area_effects.load()
