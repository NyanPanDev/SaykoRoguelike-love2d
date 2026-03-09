prism.registerActor("Tyr", function()
   return prism.Actor.fromComponents {
      prism.components.Position(),
      prism.components.Collider(),
      prism.components.Senses(),
      prism.components.Sight{ range = 12, fov = true },
      prism.components.Mover{ "walk" },
      prism.components.KoboldController(),
      prism.components.Drawable{ index = "U", color = prism.Color4.WHITE },
      prism.components.Health(100),
      prism.components.Attacker(1),
      prism.components.DropTable {
         chance = 0.5,
         entry = "SpiderMeat",
      }
   }
end)