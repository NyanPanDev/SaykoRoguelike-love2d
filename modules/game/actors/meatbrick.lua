prism.registerActor("MeatBrick", function ()
   return prism.Actor.fromComponents{
      prism.components.Name("Meat Brick"),
      prism.components.Position(),
      prism.components.Drawable { index = "%", color = prism.Color4.RED },
      prism.components.Edible(1),
      prism.components.Item{
         stackable = "MeatBrick",
         stackLimit = 99
      }
   }
end)