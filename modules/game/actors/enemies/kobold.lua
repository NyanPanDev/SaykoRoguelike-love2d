prism.registerActor("Kobold", function()
   return prism.Actor.fromComponents {
      prism.components.Position(),
      prism.components.Collider(),
      prism.components.Senses(),
      prism.components.Sight{ range = 12, fov = true },
      prism.components.Mover{ "walk" },
      prism.components.KoboldController(),
      prism.components.Drawable{ index = "k", color = prism.Color4.RED },
      prism.components.Health(3),
      prism.components.Attacker(1),
   }
end)