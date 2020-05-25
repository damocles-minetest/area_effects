
local function format_data(data)
  local str = ""
  for k, v in pairs(data) do
    str = str .. "+ " .. k .. " = '" .. v .. "'\n"
  end
  return str
end

minetest.register_chatcommand("area_effect_set", {
    params = "<ID> <key> <value>",
    description = "Sets an area attribute",
    func = function(playername, param)
      local _, _, id_str, key, value = string.find(param, "^([^%s]+)%s+([^%s])%s+(.*)$")
      if id_str == nil or not key then
        return true, "Invalid syntax!"
      end

      local id = tonumber(id_str)
      if not id then
        return true, "area-id is not numeric: " .. id_str
      end

      if not areas:isAreaOwner(id, playername) and
        not minetest.check_player_privs(playername, { protection_bypas=true }) then
        return true, "you are not the owner of area: " .. id
      end

      if value == "nil" or value == "false" then
        value = nil
      end

      local data = area_effects.get(id) or {}
      data[key] = value
      area_effects.set(id, data)

      area_effects.clear_player_cache(playername)

			return true, "Area " .. id .. "\n" .. format_data(data)
    end,
})

minetest.register_chatcommand("area_effect_get", {
    params = "<ID>",
    description = "Returns the area attributes",
    func = function(_, param)
      if param == nil then
        return true, "Invalid syntax!"
      end

      local id = tonumber(param)
      if not id then
        return true, "area-id is not numeric: " .. param
      end

      local data = epic.data_area.get(id)
      return true, "Area " .. id .. "\n" .. format_data(data)
    end
})

minetest.register_chatcommand("area_effects", {
    description = "Lists the area effects",
    func = function()
      local str = ""
      for key, description in pairs(area_effects.effects) do
        str = str .. "+ " .. key .. ": " .. description .. "\n"
      end

      return true, str
    end
})
