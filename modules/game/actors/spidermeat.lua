prism.registerActor("SpiderMeat", function ()
   return prism.Actor.fromComponents{
      prism.components.Name("Spider Meat"),
      prism.components.Position(),
      prism.components.Drawable { index = "%", color = prism.Color4.RED },
      prism.components.Edible(1),
      prism.components.Item{
         stackable = "SpiderMeat",
         stackLimit = 99
      }
   }
end)