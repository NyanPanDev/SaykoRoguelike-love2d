   local playerAtlas = spectrum.SpriteAtlas.fromASCIIGrid("display/Dungeon_Character_2.png", 16, 16)
   local display = spectrum.Display(81, 41, playerAtlas, prism.Vector2(16, 16))

   prism.registerActor("Player", function()
      local player = prism.Actor.fromComponents {
         prism.components.Name("Player"),
         prism.components.Drawable { atlas = playerAtlas, index = 3, color = prism.Color4.BLUE, layer = math.huge },
         prism.components.Position(),
         prism.components.Collider(),
         prism.components.PlayerController(),
         prism.components.Senses(),
         prism.components.Sight { range = 64, fov = true },
         prism.components.Mover { "walk" },
         prism.components.Health(10),
         prism.components.Defence(1),
         prism.components.Hunger(100),
         prism.components.Log(),
         prism.components.ConditionHolder(),
         prism.components.Inventory { limitCount = 10 },
         prism.components.Equipper {
            "head", "armor", "weapon", "boots",
            { name = "ringl", category = "ring", label = "ring"},
            { name = "ringr", category = "ring", label = "ring"},
            "amulet"
         }
      }

      local equipper = player:get(prism.components.Equipper)
      local conditions = player:get(prism.components.ConditionHolder)
      local health = player:get(prism.components.Health)
      --- Starting equipment
      if equipper then
         local katana = prism.actors.WoodenKatana()
         local katanaEquip = katana:get(prism.components.Equipment)
         if katanaEquip then
            equipper.equipped["weapon"] = katana
            if conditions and katanaEquip.condition then
               equipper.statusMap[katana] = conditions:add(katanaEquip.condition)
            end
         end

         local armor = prism.actors.ClothArmor()
         local armorEquip = armor:get(prism.components.Equipment)
         if armorEquip then
            equipper.equipped["armor"] = armor
            if conditions and armorEquip.condition then
               equipper.statusMap[armor] = conditions:add(armorEquip.condition)
            end
            health:heal(10)
         end
      end


      return player
   end)