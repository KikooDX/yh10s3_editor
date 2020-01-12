function select_slot(slot)
  object_selected = user_shortcuts[slot]
  slot_selected = slot
  for i, v in ipairs(objects_list) do
    if v == object_selected then object_cursor = i break end
  end
  if sfx then s_scroll:play() end
end

function draw_slots()
  for i = 1, 9, 1 do
    if slot_selected == i then love.graphics.setColor(0.8, 0.8, 0.8, 1)
    else love.graphics.setColor(0.2, 0.2, 0.2, 1) end
    love.graphics.rectangle("line", 8+26*((i-1)%3), 24+82*math.floor((i-1)/3), 24, 80)
    love.graphics.print(i, 12+26*((i-1)%3), 24+82*math.floor((i-1)/3))
    object = user_shortcuts[i]
    if objects_data[object].width < 24 then
      love.graphics.draw(objects_data[object].sprite,
                         20+26*((i-1)%3) - objects_data[object].width / 2,
                         64+82*math.floor((i-1)/3) - objects_data[object].height / 2)
    end
  end
end
