-- To run this program you also need to have Love2D installed.
-- Navigate to where the 'luaclick' folder is (in my case it's ~/luaprojects/love2dprojects/) and then type in 'love luaclick' in your terminal.
-- This should run the game.


-- global vars

clicks = 0
prestige = 0 -- prestige increases the amount of clicks you get per real life click.
increment = 0 -- the amount of ACTUAL clicks, used for handing out prestiges

-- main program

function love.load()
	image = love.graphics.newImage("potato.png") -- wow the image is now backgroundless
	love.graphics.setNewFont(12)
	love.graphics.setColor(255,255,255)
	love.graphics.setBackgroundColor(0,0,0)
end

function love.draw()
	love.graphics.print("Click the potato to increase your click counter. Every 500 clicks grants 1 prestige, increasing your click output.", 10, 10)
	love.graphics.print("Your current click count is:", 10, 30)
	love.graphics.print(clicks, 200, 30)
	love.graphics.print("Your current prestige is:", 10, 50)
	love.graphics.print(prestige, 200, 50)
	love.graphics.draw(image, imgx, imgy) -- draws the button
	imgx = 10
	imgy = 70
end

function love.mousepressed(x, y, button, istouch)
	if button == 1 then
		increment = increment + 1
		clicks = clicks + 1 + prestige
		love.draw()
	if increment % 500 == 0 then
		prestige = prestige + 1
	end
end
end

--function love.update()
--	if love.keyboard.isDown('d') then -- holding d shows some debug text, I should probably make this a toggle but too bad.
--		love.graphics.print("Debug stuff:", 10, 200)
--		love.graphics.print("Prestige Increment:", increment, 10, 220)
--	end
--end

-- function love update doesnt work right now and i dont know why. no debug text for you, ha!
