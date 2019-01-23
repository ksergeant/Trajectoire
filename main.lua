-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no')

-- Empèche Love de filtrer les contours des images quand elles sont redimentionnées
-- Indispensable pour du pixel art
love.graphics.setDefaultFilter("nearest")

-- Cette ligne permet de déboguer pas à pas dans ZeroBraneStudio
if arg[#arg] == "-debug" then require("mobdebug").start() end

local ListePoints = {}
local Point = {}
Point.x = 0
Point.y = 0

function DrawPoint()
  
 

end

function love.load()

  mx = -1
  my = -1
  
  LARGEUR = love.graphics.getWidth()
  HAUTEUR = love.graphics.getHeight()
  
end

function love.update(dt)
  


end

function love.draw()

--love.graphics.line(200,50, 400,50, 500,300, 100,300, 200,50)
  love.graphics.line((LARGEUR-(LARGEUR/4)), 0, (LARGEUR-(LARGEUR/4)), HAUTEUR)

  love.graphics.setColor(255, 0, 0)
 
 
  for N=1,#ListePoints do
  
    love.graphics.circle("fill",ListePoints[N].x,ListePoints[N].y,2)
  
  end
 
  
love.graphics.setColor(255, 255, 255)
love.graphics.print("Nombre de point : "..tostring(#ListePoints),(LARGEUR-(LARGEUR/4))+5,0)

end

function love.mousepressed(x, y, button, istouch)
   if button == 1 then -- Versions prior to 0.10.0 use the MouseConstant 'l'
     
     local point = {}
     point.x = x
     point.y = y
      
      table.insert(ListePoints,point)
   end
end

function love.keypressed(key)
  
  print(key)
  
end
  