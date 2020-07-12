human = {}
npc={}
view_w = 777
view_h = 472
human.points = 0
npc.points = 0
function love.load()
	love.window.setMode(view_w,view_h,{resizable=false,vsync=false})
	love.window.setTitle('DiCE')
	love.graphics.setBackgroundColor(255,255,255)
	math.randomseed(os.time())
	human.name = "You"
	npc.name = "Computer"
	human.img = love.graphics.newImage('img/d0.png')
	npc.img = love.graphics.newImage('img/d0.png')
	font = love.graphics.setNewFont("font/LeagueMono-Bold.ttf",40)
	start = true
end

function love.draw()
	love.graphics.setColor(0.8,0.8,0.8)
	if start == false then
		if human.win == true and npc.win == false then
			love.graphics.setColor(0.2,1,0.2)
			love.graphics.printf("Player Wins!", 0, view_h-150, view_w, 'center')
			love.graphics.setColor(0.8,0.8,0.8)
		elseif human.win == true and npc.win == true then
			love.graphics.setColor(0.5,1,0.8)
                	love.graphics.printf("It's a Draw Mate!", 0, view_h-150, view_w, 'center')
			love.graphics.setColor(0.8,0.8,0.8)
		else
			love.graphics.setColor(0.4,0.4,0.8)
			love.graphics.printf("Computer Wins", 0, view_h-150, view_w, 'center')
			love.graphics.setColor(0.8,0.8,0.8)
		end
	else
                love.graphics.setColor(0.3,0.9,0.1)
		love.graphics.printf("Click to roll", 0, view_h-150,view_w,'center')
                love.graphics.setColor(0.8,0.8,0.8)
	end
        love.graphics.setColor(0.2,1,0.2)
        love.graphics.printf("Player", 0, view_h-350, view_w-460, 'center')
	love.graphics.printf(human.points, 0, view_h-300, view_w-460, 'center')
        love.graphics.setColor(0.4,0.4,0.8)
        love.graphics.printf("Computer", 0, view_h-350, view_w+400, 'center')
	love.graphics.printf(npc.points, 0, view_h-300, view_w+400, 'center')
        love.graphics.setColor(0.8,0.8,0.8)
	love.graphics.draw(human.img,view_w*0.15,30,0,0.3,0.3)
	love.graphics.draw(npc.img,view_w*0.70,30,0,0.3,0.3)
	
		
end

function love.mousereleased()
	start = false
	human.roll = math.random(1,6)
	npc.roll = math.random(1,6)
	human.img = love.graphics.newImage('img/' .. human.roll .. '.png')
	npc.img = love.graphics.newImage('img/' .. npc.roll .. '.png')
	if(human.roll > npc.roll) then
		human.win = true
		human.points = human.points + 1
		npc.win = false
	elseif human.roll == npc.roll then
		human.win = true
		npc.win = true
	else
		human.win = false
		npc.win = false
                npc.points = npc.points + 1
	end
end
