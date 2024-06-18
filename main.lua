--Valores de la pantalla
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720



--Funcion al cargar el videojuego, configuramos la pantalla y los filtros 
function love.load()

    love.graphics.setDefaultFilter('nearest','nearest')
    love.window.setMode(WINDOW_WIDTH,WINDOW_HEIGHT,{
        fullscreen = false,
        resizable = false,
        vsync = true
    })
    
end


--Funcion que renderiza el mensaje de Hello Pong
function love.draw()
    love.graphics.printf("Hello Pong!", 0, WINDOW_HEIGHT / 2 - 6, WINDOW_WIDTH,'center')
    
end

 