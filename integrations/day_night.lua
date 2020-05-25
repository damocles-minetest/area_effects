
area_effects.register_effect("day_night", "float value from 0.0 to 1.0")

area_effects.register_hook({
  enter = function(player, id)
    local data = area_effects.get(id)
    if data and data.day_night then
      local num = tonumber(data.day_night)
      player:override_day_night_ratio(num)
    end
  end,

  leave = function(player, id)
    local data = area_effects.get(id)
    if data and data.day_night then
      player:override_day_night_ratio(nil)
    end
  end
})
