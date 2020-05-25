
area_effects.register_hook({
  enter = function(player, id)
    local playername = player:get_player_name()
    minetest.log("action",
      "[area_effects] player '" .. playername .. "' " ..
      "entered area " .. id
    )
  end,

  leave = function(player, id)
    local playername = player:get_player_name()
    minetest.log("action",
      "[area_effects] player '" .. playername .. "' " ..
      "left area " .. id
    )
  end
})
