
local composer = require( "composer" )

local scene = composer.newScene()


local function gotoHighScores()
	
	composer.gotoScene( "highscores", { time=800, effect="crossFade" } )
end


local function resumeButton()
	
	composer.hideOverlay({"fade",400})

end

local function exi()
	native.requestExit()

end
local function men()
	composer.gotoScene("menu", { time=800, effect="crossFade" })
end

local function ex()
	local left, top, width, height = 400, 500,800 , 1400
	resume:removeEventListener("tap",resumeButton)
	high:removeEventListener("tap",gotoHighScores)
	menu:removeEventListener("tap",men)
	exit:removeEventListener("tap",ex)
    local rec = display.newRect(left,top,width,height)
	rec:setFillColor(0,0,0)
	local ex = display.newText("Exiting",display.contentCenterX,display.contentCenterY,native.systemFontBold,60)
	timer.performWithDelay(800,exi)

	

end
	

function scene:create( event )

	local sceneGroup = self.view
    local left, top, width, height = 400, 500,800 , 1400
	
    rectangleObj = display.newRect(left,top,width,height)
    rectangleObj.alpha=0.3
    rectangleObj:setFillColor(255,255,255)
    resume = display.newText("Resume",display.contentCenterX,500,native.systemFontBold,44)
	resume:setFillColor(1,1,1)
	
	high   =display.newText("High Score",display.contentCenterX,600, native.systemFontBold,44)
	high:setFillColor(1,1,1)
	menu   =display.newText("Menu",display.contentCenterX,700, native.systemFontBold,44)
	menu:setFillColor(1,1,1)
	exit   =display.newText("Exit",display.contentCenterX,800, native.systemFontBold,44)
	exit:setFillColor(1,1,1)
    title = display.newImageRect( "title.png", 500, 80 )
    title.x = display.contentCenterX
    title.y = 200

end

function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
	

	elseif ( phase == "did" ) then
    	resume:addEventListener("tap",resumeButton)
		high:addEventListener("tap",gotoHighScores)
		menu:addEventListener("tap",men)
		exit:addEventListener("tap",ex)
    end
end

function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase
	local parent =event.parent

	if ( phase == "will" ) then
		parent:resumeGame()

	elseif ( phase == "did" ) then
		composer.removeScene('pause')
		display.remove(rectangleObj)
		display.remove(menu)
		display.remove(exit)
		display.remove(title)
		display.remove(high)
		display.remove(resume)
		

	
	end
end

function scene:destroy( event )

	local sceneGroup = self.view
	audio.dispose( musicTrack )
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene