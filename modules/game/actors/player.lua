prism.registerActor("Player", function()
   return prism.Actor.fromComponents {
      prism.components.Name("Player"),
      prism.components.Drawable { index = 3, color = prism.Color4.BLUE, layer = math.huge },
      prism.components.Position(),
      prism.components.Collider(),
      prism.components.PlayerController(),
      prism.components.Senses(),
      prism.components.Sight { range = 64, fov = true },
      prism.components.Mover { "walk" },
      prism.components.Health(10),
      prism.components.Hunger(100),
      prism.components.Log(),
      prism.components.ConditionHolder(),
      prism.components.Inventory {
         limitCount = 10,
      },
      prism.components.Equipper {
         "head",
         "armor",
         "boots",
         { name = "ringl", category = "ring", label = "ring"},
         { name = "ringr", category = "ring", label = "ring"},
         "amulet"
      }
   }
end)
