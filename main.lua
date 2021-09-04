require 'deps'
local quads, atlas, chicken, dtotal, mu = {}, {}, 0, 0, 0

-- This will be the entry point for data fills
function init()
	-- Data

	-- Music
	mu = love.audio.newSource("static/bruder.mp3", "stream")
	-- Sprites
	atlas = love.graphics.newImage("static/atlas.png")
	atlas:setFilter('linear', 'nearest')
	-- QUADS
	quads = Util.generate_quads(atlas)
	-- NPC
	chicken = quads[1]
	-- Food
	soup = quads[2]
end

function input() 
	if love.keyboard.isDown("up") then player.y = player.y - 1 end  
	if love.keyboard.isDown("down") then player.y = player.y + 1  end
	if love.keyboard.isDown("left") then player.x = player.x - 1 end
	if love.keyboard.isDown("right") then player.x = player.x + 1 end
end

function love.load()
		
	init()
	print_r(ENTITY_DEFS)
	mu:setLooping(true)

	-- mu:play()
end

function love.update(dt)
	dtotal = dt + dtotal
	input()
end

function love.draw()
	love.graphics.scale(4, 4)
	love.graphics.draw(atlas, chicken, player.x, player.y)
	love.graphics.draw(atlas, soup, 100, 100)
end
