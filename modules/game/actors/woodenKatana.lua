prism.registerActor("WoodenKatana", function()
   return prism.Actor.fromComponents {
      prism.components.Name("Wooden Katana"),
      prism.components.Drawable {
         index = "v",
         color = prism.Color4.BLUE,
      },
      prism.components.Item(),
      prism.components.AttackStatus(5),
      prism.components.Equipment(
         "weapon",
         prism.condition.Condition(prism.modifiers.AttackModifier(5))
      ),
      prism.components.Position(),
   }
end)