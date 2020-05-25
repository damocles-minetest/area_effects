
-- playername -> { id = true }
local active = {}

-- cleanup
minetest.register_on_leaveplayer(function(player)
	local playername = player:get_player_name()
	active[playername] = nil
end)

function area_effects.clear_player_cache(playername)
	active[playername] = nil
end

local function check()
  for _, player in ipairs(minetest.get_connected_players()) do
    local ppos = player:get_pos()
    local playername = player:get_player_name()

    local active_entry = active[playername]
    if not active_entry then
      active_entry = {}
      active[playername] = active_entry
    end

    local area_list = areas:getAreasAtPos(ppos)
    local current_ids = {}

    -- check areas
    for id in pairs(area_list) do
      current_ids[id] = true
      if not active_entry[id] then
        -- player entered
        area_effects.run_hook("enter", { player, id })
      end
    end

    -- check previous area-ids
    for id in pairs(active_entry) do
      if not current_ids[id] then
        -- player left
        area_effects.run_hook("leave", { player, id })
      end
    end
  end

  minetest.after(1, check)
end


minetest.after(1, check)
