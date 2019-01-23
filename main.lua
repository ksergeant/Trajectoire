-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no')

-- Empèche Love de filtrer les contours des images quand elles sont redimentionnées
-- Indispensable pour du pixel art
love.graphics.setDefaultFilter("nearest")

-- Cette ligne permet de déboguer pas à pas dans ZeroBraneStudio
if arg[#arg] == "-debug" then require("mobdebug").start() end

local ListePoints = {}
local ListePointsGui = {}
local Point = {}
Point.x = 0
Point.y = 0
Point.name = "P"
Point.position = 0

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
    ListePoints[N].position = N
  end
 
  
love.graphics.setColor(255, 255, 255)
love.graphics.print("Nombre de point : "..tostring(#ListePoints),(LARGEUR-(LARGEUR/4))+5,0)
love.graphics.line((LARGEUR-(LARGEUR/4)), 20, LARGEUR, 20)

  if #ListePoints ~= 0 then
    local yGui = 30
    for N =1,#ListePoints do
      ListePointsGui[N] = ListePoints[N]
      love.graphics.print("P"..tostring(ListePointsGui[N].position),(LARGEUR-(LARGEUR/4))+10,yGui)
      love.graphics.print("x:"..tostring(ListePointsGui[N].x),(LARGEUR-(LARGEUR/4))+60,yGui)
      love.graphics.print("y:"..tostring(ListePointsGui[N].y),(LARGEUR-(LARGEUR/4))+110,yGui)
      yGui = yGui + 15
    end
  end

end

function love.mousepressed(x, y, button, istouch)
   if button == 1 then -- Versions prior to 0.10.0 use the MouseConstant 'l'
     
     local point = {}
     
     if x > (LARGEUR-(LARGEUR/4)) then
       
      point.x = (LARGEUR-(LARGEUR/4))-4
      point.y = y
      else
    
      point.x = x
      point.y = y
      end
      table.insert(ListePoints,point)
   end
end

function love.keypressed(key)
  
  print(key)
  
end
  