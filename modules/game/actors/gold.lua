prism.registerActor("Gold", function()
   return prism.Actor.fromComponents {
      prism.components.Name("Gold"),
      prism.components.Drawable {
         index = "$",
         color = prism.Color4.YELLOW,
      },
      prism.components.Item(),
      prism.components.Position(),
   }
end)