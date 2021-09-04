-- The entity module

Entity = {}

-- Returns a new entity
function Entity:init(def)
	self.type = def.type

	self.dir = 'down'

	self.animation = self:newAnimation(def.animation)

	self.x = def.x or 0
	self.y = def.y or 0
	self.walkSpeed	= def.walkSpeed or 0.15

	self.dead = false
end

function Entity:newAnimation(ani)

end
