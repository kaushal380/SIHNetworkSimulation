-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
-- local physics = require "physics"
-- physics.start()
print("heii")
display.setStatusBar( display.TranslucentStatusBar )

local lineX = 1650
local star = display.newLine( lineX, -200, lineX, 1000 )
star:setStrokeColor( 1, 10, 0, 10 )
star.strokeWidth = 8


local mapRight = display.newImageRect( "mapsOnRight.png", 2560, 2600 )
mapRight.x = 2050
mapRight.y = 420

local bus1 = display.newImageRect('bus.png', 2000, 2000)
bus1.x = 2250
bus1.y = -80
bus1:rotate(-50)

local function bus13path()

    bus1:rotate(-90)
    transition.moveTo(bus1, {x = 2200, y = 700, time = 10000})
end

local function bus12ndPath()
    bus1:rotate(-40)
    transition.moveTo( bus1, { x=1980, y=700, time=10000, onComplete = bus13path} )
    -- print("doneee")
    -- transition.to(bus1, {rotation = -1, time=200, transition=easing.inOutCubic})
end

transition.moveTo( bus1, { x=1980, y=210, time=13000, onComplete = bus12ndPath} )

local bus2 = display.newImageRect('bus.png', 2000, 2000)
bus2.x = 3000
bus2.y = 910
bus2:rotate(0)

transition.moveTo(bus2, {x= 1800, y = 910, time = 13000})

local busStop = display.newImageRect('busStop.png', 300, 300)
busStop.x = 2200
busStop.y = 715

local busStopText = display.newText("bus stop", 2200, 650, native.systemFont, 40)
busStopText:setFillColor(1, 1,1)
local bgImg = display.newImageRect('backgroundImg.png', 5000, 3600)
bgImg.x = 800
bgImg.y = 450
bgImg:toBack()


local myText1 = display.newText( "2 available busses:", 490, 300, native.systemFont, 80 )
myText1:setFillColor( 0, 0, 0 )

local myText2 = display.newText( "230J Ambala to Baddi", 500, 500, native.systemFont, 60 )
myText2:setFillColor( 0, 0, 0 )

local myText3 = display.newText( "140/21K Anupgarh to Jassur", 500, 700, native.systemFont, 60 )
myText3:setFillColor( 0, 0, 0 )


local mapOnRight = display.newImageRect('mapOnLeft.png', 2500, 2000)
mapOnRight.x = 720
mapOnRight.y = 500
mapOnRight.alpha = 0

local locationPoint = display.newImageRect('locationLogo.png', 1500, 1000)
locationPoint.x = 1200
locationPoint.y = 600
locationPoint.alpha = 0

local busTracker = display.newImageRect('busTracker.png', 320, 200)
busTracker.x = 500
busTracker.y = -30
busTracker.alpha = 0
local eta = 20

local ETATrack = display.newText("Arrival: "..eta.." mins", 1250, 860, native.systemFont, 80)
ETATrack:setFillColor( 1, 0, 0 )
ETATrack.alpha = 0

local function UpdateETA()
    ETATrack:removeSelf()
    ETATrack = display.newText("Arrival: Arrived", 1250, 860, native.systemFont, 80)
    ETATrack:setFillColor( 1, 0, 0 )
end 
local function busTrackingHorizontal()
    ETATrack:removeSelf()
    eta = 5
    ETATrack = display.newText("Arrival: "..eta.." mins", 1250, 860, native.systemFont, 80)
    ETATrack:setFillColor( 1, 0, 0 )
    transition.moveTo(busTracker, {x= 1200, y = 750, time = 10000, onComplete = UpdateETA})
end
local function busTrackingVerticle()
    ETATrack:removeSelf()
    eta = 10
    ETATrack = display.newText("Arrival: "..eta.." mins", 1250, 860, native.systemFont, 80)
    ETATrack:setFillColor( 1, 0, 0 )
    transition.moveTo(busTracker, {x= 330, y = 750, time = 10000, onComplete = busTrackingHorizontal})
end
local function trackTheBus()
    -- print("tracking starts")
    transition.fadeIn(ETATrack, {time = 2900})
    transition.moveTo(busTracker, {x= 330, y = 200, time = 7000, onComplete = busTrackingVerticle})
end

local function removeText()

    -- print("u can remove now")
    transition.fadeOut(myText1, {time = 500})
    transition.fadeOut(myText2, {time = 500})
    transition.fadeOut(myText3, {time = 500})
    transition.fadeIn(mapOnRight, {time = 2000})
    transition.fadeIn(locationPoint, {time = 2500})
    -- transition.fadeIn(ETATrack, {time = 3500})
    transition.fadeIn(busTracker, {time = 2500, onComplete = trackTheBus})

end


myText3:addEventListener("touch", removeText)


