

-- setter / getter / lookup

function area_effects.set(id, value)
  area_effects.area_data[id] = value
  area_effects.save()
end

-- returns "xy" (the data) or nil
function area_effects.get(id)
  return area_effects.area_data[id]
end

areas:registerOnRemove(function(id)
  area_effects.area_data[id] = nil
  area_effects.save()
end)
