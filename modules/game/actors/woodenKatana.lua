prism.registerActor("WoodenKatana", function()
   return prism.Actor.fromComponents {
      prism.components.Name("Wooden Katana"),
      prism.components.Drawable {
         index = "v",
         color = prism.Color4.BLUE,
      },
      prism.components.Item(),
      prism.components.Equipment(
         "weapon",
         prism.condition.Condition(prism.modifiers.HealthModifier(5))
      ),
      prism.components.Position(),
   }
end)