
area_effects.register_effect("no_clouds", "disables the clouds")

area_effects.register_hook({
  enter = function(player, id)
    local data = area_effects.get(id)
    if data and data.no_clouds then
      player:set_clouds({density=0,speed=0})
    end
  end,

  leave = function(player, id)
    local data = area_effects.get(id)
    if data and data.no_clouds then
      player:set_clouds({
        thickness=16,
        color={r=243, g=214, b=255, a=229},
        ambient={r=0, g=0, b=0, a=255},
        density=0.4,
        height=100,
        speed={y=-2,x=-1}
      })
    end
  end
})
