
area_effects.register_effect("sound", "background-sound from /sound_list")

-- playername -> sound-handle
local handles = {}

area_effects.register_hook({
  enter = function(player, id)
    local data = area_effects.get(id)
    if data and data.sound then
      for _, sounddef in pairs(soundblock.sounds) do
        if sounddef.key == data.sound then
					local playername = player:get_player_name()
          minetest.log(
            "action",
            "[area_effects] setting sound '" .. sounddef.key ..
            "' for player " .. playername
          )
					local filename = sounddef.filename
					if sounddef.filenames then
						filename = sounddef.filenames[math.random(1, #sounddef.filenames)]
					end

          if handles[playername] then
            -- clear previous sound
            minetest.sound_stop(handles[playername])
          end

					handles[playername] = minetest.sound_play(filename, {
						to_player = playername,
						gain = 1.0,
						loop = true
					})

          break
        end
      end
    end
  end,

  leave = function(player, id)
    local data = area_effects.get(id)
    if data and data.sound then
			local playername = player:get_player_name()
      minetest.log(
        "action",
        "[area_effects] clearing sound" ..
        " for player" .. playername
      )
			local handle = handles[playername]
			if handle then
				minetest.sound_stop(handle)
				handles[playername] = nil
			end
    end
  end
})



minetest.register_chatcommand("sound_list", {
	description = "Lists all available sounds",
	func = function()
		local list = ""
		for _, sounddef in pairs(soundblock.sounds) do
			list = list .. sounddef.key .. ","
		end

		return true, list
	end
})

-- cleanup
minetest.register_on_leaveplayer(function(player)
	local playername = player:get_player_name()
	handles[playername] = nil
end)

minetest.register_chatcommand("area_effect_stopsound", {
	description = "Stops the current area effect sound for the given player",
	func = function(_, playername)
    if handles[playername] then
      -- clear sound
      minetest.sound_stop(handles[playername])
    end

		return true
	end
})
