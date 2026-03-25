prism.registerActor("ClothArmor", function()
   return prism.Actor.fromComponents {
      prism.components.Name("Cloth Armor"),
      prism.components.Drawable {
         index = "z",
         color = prism.Color4.BLUE,
      },
      prism.components.Item(),
      prism.components.Defence(2),
      prism.components.Equipment(
         "armor",
         prism.condition.Condition(prism.modifiers.DefenceModifier(5))
      ),
      prism.components.Position(),
   }
end)