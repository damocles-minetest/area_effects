
area_effects.register_effect("weather", "weather definitions")

area_effects.register_hook({
  enter = function(player, id)
    local data = area_effects.get(id)
    if data and data.weather then
      epic_weather.current_weather[player:get_player_name()] = data.weather
    end
  end,

  leave = function(player, id)
    local data = area_effects.get(id)
    if data and data.weather then
      epic_weather.current_weather[player:get_player_name()] = nil
    end
  end
})
