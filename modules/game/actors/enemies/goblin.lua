prism.registerActor("Goblin", function()
   return prism.Actor.fromComponents {
      prism.components.Position(),
      prism.components.Collider(),
      prism.components.Senses(),
      prism.components.Sight{ range = 12, fov = true },
      prism.components.Mover{ "walk" },
      prism.components.KoboldController(),
      prism.components.Drawable{ index = "g", color = prism.Color4.RED },
   }
end)