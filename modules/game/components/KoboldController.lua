local KoboldController = prism.components.Controller:extend("KoboldController")

function KoboldController:init()
   self.roamTarget = nil
end

function KoboldController:act(level, actor)
   local senses = actor:get(prism.components.Senses)
   local mover = actor:get(prism.components.Mover)
   if not senses or not mover then return prism.actions.Wait(actor) end

   local actorPos = actor:getPosition()
   local player = senses:query(level, prism.components.PlayerController):first()

   --- Chasing
   if player then
      self.roamTarget = nil
      local playerPos = player:getPosition()
      
      local attack = prism.actions.Attack(actor, player)
      if level:canPerform(attack) then
         return attack
      end

      local path = level:findPath(actorPos, playerPos, actor, mover.mask, 1)
      if path then
         local nextStep = path:pop()
         if nextStep then
            local move = prism.actions.Move(actor, nextStep)
            if level:canPerform(move) then
               return move
            end
         end
      end
   end

   if not self.roamTarget or actorPos:equals(self.roamTarget) then
      local rx = actorPos.x + love.math.random(-5, 5)
      local ry = actorPos.y + love.math.random(-5, 5)
      self.roamTarget = prism.Vector2(rx, ry)
   end
   --- Roaming
   local roamPath = level:findPath(actorPos, self.roamTarget, actor, mover.mask, 1)
   if roamPath then
      local nextStep = roamPath:pop()
      if nextStep then
         local move = prism.actions.Move(actor, nextStep)
         if level:canPerform(move) then
            return move
         end
      end
   end
   --- If all else fails
   self.roamTarget = nil 
   return prism.actions.Wait(actor)
end

return KoboldController