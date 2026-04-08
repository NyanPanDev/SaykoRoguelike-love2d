-- prism.components.Value = function(amount)
--     return {
--         amount = amount or 1
--     }
-- end

prism.registerActor("Gold", function()
   return prism.Actor.fromComponents {
      prism.components.Name("Gold"),
      prism.components.Drawable {
         index = "$",
         color = prism.Color4.YELLOW,
      },
      prism.components.Item(),
      prism.components.Position(),
      prism.components.Item{
         stackable = "Gold",
         stackLimit = 10000
      }
   }
end)