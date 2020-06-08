
area_effects.register_effect("skybox", "names from /skybox_list")

area_effects.register_hook({
  enter = function(player, id)
    local data = area_effects.get(id)
    if data and data.skybox then
      for _, skyboxdef in ipairs(epic_skybox.list) do
        if skyboxdef.name == data.skybox then
          minetest.log(
            "action",
            "[area_effects] setting skybox " .. skyboxdef.name ..
            " for player" .. player:get_player_name()
          )
          epic_skybox.set_skybox(player, skyboxdef)
          break
        end
      end
    end
  end,

  leave = function(player, id)
    local data = area_effects.get(id)
    if data and data.skybox then
      minetest.log(
        "action",
        "[area_effects] clearing skybox " ..
        " for player" .. player:get_player_name()
      )
      epic_skybox.set_skybox(player, {})
    end
  end
})
