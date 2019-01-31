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
    love.graphics.print("P"..tostring(ListePoints[N].position),(ListePoints[N].x)-7,(ListePoints[N].y)+5)

    
  end
 
  
love.graphics.setColor(255, 255, 255)
love.graphics.setColor(0.3, 1, 0) -- Vert Lime

love.graphics.print("Nombre de point : "..tostring(#ListePoints),(LARGEUR-(LARGEUR/4))+5,2)
love.graphics.setColor(0.5, 0.6, 0.8) -- Bleu gris

love.graphics.rectangle("fill", (LARGEUR-(LARGEUR/4))+150,0,200,20) -- Bouton Effacer
love.graphics.setColor(0.8, 0, 0) -- Rouge

love.graphics.print("Effacer les points ",(LARGEUR-(LARGEUR/4))+200,2)
love.graphics.setColor(255, 255, 255) -- Blanc

love.graphics.line((LARGEUR-(LARGEUR/4)), 20, LARGEUR, 20)

  if #ListePoints ~= 0 then
    local yGui = 30
    for N =1,#ListePoints do
      ListePointsGui[N] = ListePoints[N]
      love.graphics.print("P"..tostring(ListePointsGui[N].position),(LARGEUR-(LARGEUR/4))+10,yGui)
      love.graphics.print("X: "..tostring(ListePointsGui[N].x),(LARGEUR-(LARGEUR/4))+60,yGui)
      love.graphics.print("Y: "..tostring(ListePointsGui[N].y),(LARGEUR-(LARGEUR/4))+110,yGui)
      yGui = yGui + 15
    end
  end

end

function love.mousepressed(x, y, button, istouch)
   if (button == 1 and x < (LARGEUR-(LARGEUR/4))) then 
     
     local point = {}
      point.x = x
      point.y = y
      table.insert(ListePoints,point)
      
   end
   
   if (button == 1 and x > (LARGEUR-(LARGEUR/4))+149  and y < 21) then
     for k in pairs (ListePoints) do
        ListePoints[k] = nil
      end
    end
   
end

function love.keypressed(key)
  
  print(key)
  
end
  