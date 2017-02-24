% PRATHAM THUKRAL
% ICS 201 - 09
% June 21,2016
% INFO: This is a wire puzzle game which will fight a virus once the wires are connected

View.Set ("graphics:1000;600,nobuttonbar,offscreenonly")

% var definitions
% x,y, and buttons are the mouse where variables
% rowNum changes the row number for the mouse hovering loop
% moveCounter counts the number of clicks so the tutorial shows up at certain times
% tutorialFont is the font used in the tutorial pop ups
% grid_x,grid_y are the variables used to create the lines on the grid
% character_x and _y are used to change the x and y values for the character
% boxSizeX and boxSizeY are the arrays used to create boxes on the grid when the mouse hovers over it
% UPPERBOX is a constant used to add or subtract one, this is so the mouse hovering box will not overlap with the grid lines
% time1r var is to count down for the level
% timeFont is used to display how much time the person has left
% There are 12 different picture types, each one is unique and uses a different file Name
% columnCounter counts the column the wire is in
% pipeNumber is used to determine all 32 wires
% level determines what level the user is currently on
% blockedWire is the wire squares with the X, meaning it cannot be changed
% loadingBackground is the background during the introduction spaceship gif
% loadingGif is an array that runs 61 pictures quickly to create a sprite
% xStory and yStory are variables used to bring up the letter display about the game
% backstory is an image that is formatted like a letter and gives insight to the backstory of the game
% clickanywhere font is used to indicate when the user can continue 
% menuFont1 is used throughout the menu for the play, instructions, and about buttons
% gameLoop is a boolean that launches the game once "play" is pressed
% instructionClock is an image of a clock in the background of the instructions page
% soundsetting is a variable used to toggle the music
% ufoShip is a picture of the enemy ufo ship
% incorrectWires and correctWires, Straight and Curved are arrays to set an image file 









% var declarations
var x, y, button : int
var rowNum : int
var moveCounter : int := 1
var tutorialFont : int := Font.New ("serif:18")
var grid_x, grid_y : int := 0
var character_x, character_y : int
var boxSizeX : array 1 .. 8 of int
var boxSizeY : array 1 .. 4 of int
const UPPERBOX := 100
var timer : int := 25000
var timeFont : int := Font.New ("serif:14")
var columnCounter : int
var pipeNumber : array 1 .. 32 of int
var level : int := 1
var blockedWire : int := Pic.FileNew ("blocked wire.jpg")
var loadingBackground : int := Pic.FileNew ("loading background.jpg")
var loadingScreenFont : int := Pic.FileNew ("loading font.jpg")
var loadingGif : array 0 .. 61 of int
var loadingCounter : int := 0
var xStory, yStory : int := -600
var backstory : int := Pic.FileNew ("backStoryFont.jpg")
var clickanywhere : int := Font.New ("system:15")
var menuFont1 : int := Font.New ("system:18")
var gameLoop : boolean := false
var instructionClock : int := Pic.FileNew ("instructionClock.jpg")
var soundSetting : int := 1
var ufoShip : int := Pic.FileNew ("ufoShip.jpg")
var explosionImg : int := Pic.FileNew ("explosion.jpg")
var check : int
const pathName : string := "Highscore.txt"
var file : int
var prevHigh : int 
var highscore : int










var incorrectWiresStraight : array 1 .. 4 of int
incorrectWiresStraight (1) := Pic.FileNew ("Straight incorrect 1.jpg")
incorrectWiresStraight (2) := Pic.FileNew ("Straight incorrect 2.jpg")
incorrectWiresStraight (3) := Pic.FileNew ("Straight incorrect 1.jpg")
incorrectWiresStraight (4) := Pic.FileNew ("Straight incorrect 2.jpg")

var incorrectWiresCurved : array 1 .. 4 of int
incorrectWiresCurved (1) := Pic.FileNew ("Curved incorrect 1.jpg")
incorrectWiresCurved (2) := Pic.FileNew ("Curved incorrect 2.jpg")
incorrectWiresCurved (3) := Pic.FileNew ("Curved incorrect 3.jpg")
incorrectWiresCurved (4) := Pic.FileNew ("Curved incorrect 4.jpg")

var correctWiresStraight : array 1 .. 4 of int
correctWiresStraight (1) := Pic.FileNew ("Straight correct 1.jpg")
correctWiresStraight (2) := Pic.FileNew ("Straight correct 2.jpg")
correctWiresStraight (3) := Pic.FileNew ("Straight correct 1.jpg")
correctWiresStraight (4) := Pic.FileNew ("Straight correct 2.jpg")

var correctWiresCurved : array 1 .. 4 of int
correctWiresCurved (1) := Pic.FileNew ("Curved correct 1.jpg")
correctWiresCurved (2) := Pic.FileNew ("Curved correct 2.jpg")
correctWiresCurved (3) := Pic.FileNew ("Curved correct 3.jpg")
correctWiresCurved (4) := Pic.FileNew ("Curved correct 4.jpg")

% makes all pipeNumber variables in the array equal to 1
for changerVar : 1 .. 32
    randint (pipeNumber (changerVar), 1, 4)
end for

% Spaceship loading gif array
% Sets each image as a value in the array 
for loading : 0 .. 61
    loadingGif (loading) := Pic.FileNew ("loading images/frame_" + intstr (loading) + "_delay-0.04s.gif")
end for

% Wire drawing for Level 1
procedure wires
    grid_x := 101
    grid_y := 101

    if level = 1 then
	Pic.Draw (incorrectWiresCurved (pipeNumber (1)), grid_x, grid_y, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (2)), grid_x + 100, grid_y, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (3)), grid_x + 200, grid_y, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (4)), grid_x + 300, grid_y, 0)
	Pic.Draw (incorrectWiresStraight (pipeNumber (5)), grid_x + 400, grid_y, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (6)), grid_x + 500, grid_y, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (7)), grid_x + 600, grid_y, 0)
	Pic.Draw (incorrectWiresStraight (pipeNumber (8)), grid_x + 700, grid_y, 0)

	Pic.Draw (incorrectWiresCurved (pipeNumber (9)), grid_x, grid_y + 100, 0)
	Pic.Draw (incorrectWiresStraight (pipeNumber (10)), grid_x + 100, grid_y + 100, 0)
	Pic.Draw (incorrectWiresStraight (pipeNumber (11)), grid_x + 200, grid_y + 100, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (12)), grid_x + 300, grid_y + 100, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (13)), grid_x + 400, grid_y + 100, 0)
	Pic.Draw (incorrectWiresStraight (pipeNumber (14)), grid_x + 500, grid_y + 100, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (15)), grid_x + 600, grid_y + 100, 0)
	Pic.Draw (incorrectWiresStraight (pipeNumber (16)), grid_x + 700, grid_y + 100, 0)

	Pic.Draw (incorrectWiresStraight (pipeNumber (17)), grid_x, grid_y + 200, 0)
	Pic.Draw (incorrectWiresStraight (pipeNumber (18)), grid_x + 100, grid_y + 200, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (19)), grid_x + 200, grid_y + 200, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (20)), grid_x + 300, grid_y + 200, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (21)), grid_x + 400, grid_y + 200, 0)
	Pic.Draw (incorrectWiresStraight (pipeNumber (22)), grid_x + 500, grid_y + 200, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (23)), grid_x + 600, grid_y + 200, 0)
	Pic.Draw (incorrectWiresStraight (pipeNumber (24)), grid_x + 700, grid_y + 200, 0)

	Pic.Draw (incorrectWiresCurved (pipeNumber (25)), grid_x, grid_y + 300, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (26)), grid_x + 100, grid_y + 300, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (27)), grid_x + 200, grid_y + 300, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (28)), grid_x + 300, grid_y + 300, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (29)), grid_x + 400, grid_y + 300, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (30)), grid_x + 500, grid_y + 300, 0)
	Pic.Draw (incorrectWiresStraight (pipeNumber (31)), grid_x + 600, grid_y + 300, 0)
	Pic.Draw (incorrectWiresStraight (pipeNumber (32)), grid_x + 700, grid_y + 300, 0)
    % level 2 wire layout
    elsif level = 2 then
	% Virus that switches 13 wires randomly
	if moveCounter = 110 then
	    for virus : 1 .. 13
		randint (pipeNumber (Rand.Int (1, 32)), 1, 4)
	    end for
	end if
	Pic.Draw (incorrectWiresStraight (pipeNumber (1)), grid_x, grid_y, 0)
	Pic.Draw (incorrectWiresStraight (pipeNumber (2)), grid_x + 100, grid_y, 0)
	Pic.Draw (incorrectWiresStraight (pipeNumber (3)), grid_x + 200, grid_y, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (4)), grid_x + 300, grid_y, 0)
	Pic.Draw (incorrectWiresStraight (pipeNumber (5)), grid_x + 400, grid_y, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (6)), grid_x + 500, grid_y, 0)
	Pic.Draw (incorrectWiresStraight (pipeNumber (7)), grid_x + 600, grid_y, 0)
	Pic.Draw (incorrectWiresStraight (pipeNumber (8)), grid_x + 700, grid_y, 0)

	Pic.Draw (incorrectWiresCurved (pipeNumber (9)), grid_x, grid_y + 100, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (10)), grid_x + 100, grid_y + 100, 0)
	Pic.Draw (incorrectWiresStraight (pipeNumber (11)), grid_x + 200, grid_y + 100, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (12)), grid_x + 300, grid_y + 100, 0)
	Pic.Draw (incorrectWiresStraight (pipeNumber (13)), grid_x + 400, grid_y + 100, 0)
	Pic.Draw (incorrectWiresStraight (pipeNumber (14)), grid_x + 500, grid_y + 100, 0)
	Pic.Draw (incorrectWiresStraight (pipeNumber (15)), grid_x + 600, grid_y + 100, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (16)), grid_x + 700, grid_y + 100, 0)

	Pic.Draw (incorrectWiresCurved (pipeNumber (17)), grid_x, grid_y + 200, 0)
	Pic.Draw (incorrectWiresStraight (pipeNumber (18)), grid_x + 100, grid_y + 200, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (19)), grid_x + 200, grid_y + 200, 0)
	Pic.Draw (incorrectWiresStraight (pipeNumber (20)), grid_x + 300, grid_y + 200, 0)
	Pic.Draw (incorrectWiresStraight (pipeNumber (21)), grid_x + 400, grid_y + 200, 0)
	Pic.Draw (incorrectWiresStraight (pipeNumber (22)), grid_x + 500, grid_y + 200, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (23)), grid_x + 600, grid_y + 200, 0)
	Pic.Draw (incorrectWiresStraight (pipeNumber (24)), grid_x + 700, grid_y + 200, 0)

	Pic.Draw (incorrectWiresCurved (pipeNumber (25)), grid_x, grid_y + 300, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (26)), grid_x + 100, grid_y + 300, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (27)), grid_x + 200, grid_y + 300, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (28)), grid_x + 300, grid_y + 300, 0)
	Pic.Draw (incorrectWiresStraight (pipeNumber (29)), grid_x + 400, grid_y + 300, 0)
	Pic.Draw (incorrectWiresStraight (pipeNumber (30)), grid_x + 500, grid_y + 300, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (31)), grid_x + 600, grid_y + 300, 0)
	Pic.Draw (incorrectWiresStraight (pipeNumber (32)), grid_x + 700, grid_y + 300, 0)
    % level 3 wire layout
    elsif level = 3 then
	% Virus that switches 13 wires randomly    
	if moveCounter = 210 then
	    for virus : 1 .. 13
		randint (pipeNumber (Rand.Int (1, 32)), 1, 4)
	    end for
	end if
	Pic.Draw (incorrectWiresCurved (pipeNumber (1)), grid_x, grid_y, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (2)), grid_x + 100, grid_y, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (3)), grid_x + 200, grid_y, 0)
	Pic.Draw (incorrectWiresStraight (pipeNumber (4)), grid_x + 300, grid_y, 0)
	Pic.Draw (incorrectWiresStraight (pipeNumber (5)), grid_x + 400, grid_y, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (6)), grid_x + 500, grid_y, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (7)), grid_x + 600, grid_y, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (8)), grid_x + 700, grid_y, 0)

	Pic.Draw (incorrectWiresCurved (pipeNumber (9)), grid_x, grid_y + 100, 0)
	Pic.Draw (incorrectWiresStraight (pipeNumber (10)), grid_x + 100, grid_y + 100, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (11)), grid_x + 200, grid_y + 100, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (12)), grid_x + 300, grid_y + 100, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (13)), grid_x + 400, grid_y + 100, 0)
	Pic.Draw (incorrectWiresStraight (pipeNumber (14)), grid_x + 500, grid_y + 100, 0)
	Pic.Draw (blockedWire, grid_x + 600, grid_y + 100, 0)
	Pic.Draw (incorrectWiresStraight (pipeNumber (16)), grid_x + 700, grid_y + 100, 0)

	Pic.Draw (incorrectWiresCurved (pipeNumber (17)), grid_x, grid_y + 200, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (18)), grid_x + 100, grid_y + 200, 0)
	Pic.Draw (blockedWire, grid_x + 200, grid_y + 200, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (20)), grid_x + 300, grid_y + 200, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (21)), grid_x + 400, grid_y + 200, 0)
	Pic.Draw (incorrectWiresStraight (pipeNumber (22)), grid_x + 500, grid_y + 200, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (23)), grid_x + 600, grid_y + 200, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (24)), grid_x + 700, grid_y + 200, 0)

	Pic.Draw (incorrectWiresCurved (pipeNumber (25)), grid_x, grid_y + 300, 0)
	Pic.Draw (incorrectWiresStraight (pipeNumber (26)), grid_x + 100, grid_y + 300, 0)
	Pic.Draw (incorrectWiresStraight (pipeNumber (27)), grid_x + 200, grid_y + 300, 0)
	Pic.Draw (incorrectWiresStraight (pipeNumber (28)), grid_x + 300, grid_y + 300, 0)
	Pic.Draw (blockedWire, grid_x + 400, grid_y + 300, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (30)), grid_x + 500, grid_y + 300, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (31)), grid_x + 600, grid_y + 300, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (32)), grid_x + 700, grid_y + 300, 0)
    % level 4 wire layout
    elsif level = 4 then
	% Virus that switches 13 wires randomly
	if moveCounter = 310 then
	    for virus : 1 .. 13
		randint (pipeNumber (Rand.Int (1, 32)), 1, 4)
	    end for
	end if
	Pic.Draw (incorrectWiresCurved (pipeNumber (1)), grid_x, grid_y, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (2)), grid_x + 100, grid_y, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (3)), grid_x + 200, grid_y, 0)
	Pic.Draw (incorrectWiresStraight (pipeNumber (4)), grid_x + 300, grid_y, 0)
	Pic.Draw (incorrectWiresStraight (pipeNumber (5)), grid_x + 400, grid_y, 0)
	Pic.Draw (blockedWire, grid_x + 500, grid_y, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (7)), grid_x + 600, grid_y, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (8)), grid_x + 700, grid_y, 0)

	Pic.Draw (incorrectWiresStraight (pipeNumber (9)), grid_x, grid_y + 100, 0)
	Pic.Draw (incorrectWiresStraight (pipeNumber (10)), grid_x + 100, grid_y + 100, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (11)), grid_x + 200, grid_y + 100, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (12)), grid_x + 300, grid_y + 100, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (13)), grid_x + 400, grid_y + 100, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (14)), grid_x + 500, grid_y + 100, 0)
	Pic.Draw (incorrectWiresStraight (pipeNumber (15)), grid_x + 600, grid_y + 100, 0)
	Pic.Draw (blockedWire, grid_x + 700, grid_y + 100, 0)

	Pic.Draw (incorrectWiresCurved (pipeNumber (17)), grid_x, grid_y + 200, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (18)), grid_x + 100, grid_y + 200, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (19)), grid_x + 200, grid_y + 200, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (20)), grid_x + 300, grid_y + 200, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (21)), grid_x + 400, grid_y + 200, 0)
	Pic.Draw (incorrectWiresStraight (pipeNumber (22)), grid_x + 500, grid_y + 200, 0)
	Pic.Draw (blockedWire, grid_x + 600, grid_y + 200, 0)
	Pic.Draw (incorrectWiresStraight (pipeNumber (24)), grid_x + 700, grid_y + 200, 0)

	Pic.Draw (incorrectWiresStraight (pipeNumber (25)), grid_x, grid_y + 300, 0)
	Pic.Draw (incorrectWiresStraight (pipeNumber (26)), grid_x + 100, grid_y + 300, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (27)), grid_x + 200, grid_y + 300, 0)
	Pic.Draw (blockedWire, grid_x + 300, grid_y + 300, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (29)), grid_x + 400, grid_y + 300, 0)
	Pic.Draw (incorrectWiresCurved (pipeNumber (30)), grid_x + 500, grid_y + 300, 0)
	Pic.Draw (incorrectWiresStraight (pipeNumber (31)), grid_x + 600, grid_y + 300, 0)
	Pic.Draw (incorrectWiresStraight (pipeNumber (32)), grid_x + 700, grid_y + 300, 0)
    end if
end wires


% background during loading gif
Pic.Draw (loadingBackground, 0, 0, 0)
% Spaceship gif
loop
    for loadingtest : 0 .. 61
	Pic.Draw (loadingGif (loadingtest), 250, 50, 0)
	Pic.Draw (loadingScreenFont, 300, 10, 0)
	delay (30)
	View.Update
    end for
    loadingCounter += 1
    exit when loadingCounter = 4
end loop

% Back story letter display
for storyAnimation : 1 .. 600
    Pic.Draw (backstory, xStory, yStory, 0)
    % animates the letter so it floats across the scene
    xStory += 1
    yStory += 1
    View.Update
    delay (5)
end for

% click anywhere to continue function
delay (2000)
Font.Draw ("click anywhere to continue", 800, 30, clickanywhere, white)
View.Update
loop
    Mouse.Where (x, y, button)
    exit when x > 0 and x < maxx and y > 0 and y < maxy and button = 1
end loop

% play, instructions, about screen
xStory := -400
for buttonAnimations : 1 .. 700 % moves the options across the screen (animation)
    cls
    drawfillbox (0, 0, maxx, maxy, black) % background
    % play
    drawline (xStory + 400, 50, xStory + 400, 150, green)
    drawline (xStory, 50, xStory, 150, green)
    drawline (xStory + 400, 50, xStory, 50, green)
    % instructions
    drawline (xStory + 400, 200, xStory + 400, 300, green)
    drawline (xStory, 200, xStory, 300, green)
    drawline (xStory + 400, 200, xStory, 200, green)
    % about
    drawline (xStory + 400, 350, xStory + 400, 450, green)
    drawline (xStory, 350, xStory, 450, green)
    drawline (xStory + 400, 350, xStory, 350, green)
    xStory += 1
    View.Update
    delay (1)
end for

% responsiveness of the menu screen
loop
    Mouse.Where (x, y, button)
    % button hover
    if x >= 300 and x <= 700 and y >= 50 and y <= 150 and button = 0 then
	drawline (xStory + 400, 50, xStory + 400, 150, brightgreen)
	drawline (xStory, 50, xStory, 150, brightgreen)
	drawline (xStory + 400, 50, xStory, 50, brightgreen)
	drawline (xStory + 400, 150, xStory, 150, brightgreen)
    % button clicked
    elsif x >= 300 and x <= 700 and y >= 50 and y <= 150 and button = 1 then
	drawline (xStory + 400, 50, xStory + 400, 150, yellow)
	drawline (xStory, 50, xStory, 150, yellow)
	drawline (xStory + 400, 50, xStory, 50, yellow)
	drawline (xStory + 400, 150, xStory, 150, yellow)
	% Circle animation to go into the settings section
	for instructionAnimate : 1 .. 500
	    drawfilloval (maxx div 2, maxy div 2, instructionAnimate, instructionAnimate, black)
	    View.Update
	end for
	delay (100)
	% sound option , on or off
	loop
	    Mouse.Where (x, y, button)
	    Font.Draw ("A Pratham Thukral Game", 50, 550, menuFont1, brightgreen)
	    Font.Draw ("Sound: ", 100, 500, menuFont1, brightgreen)
	    drawfillbox(200,500,220,520,yellow)
	    % if sound option hovered over
	    if x>=200 and x<=220 and y>=500 and y<=520 and button=1 then
		delay(200)
		soundSetting := soundSetting + 1
		    % if soundsetting is off or on, mod 2 = is sounds on
		    if soundSetting mod 2 = 0 then
			drawfillbox(200,500,220,520,brightgreen)
			View.Update
			Music.PlayFileReturn("Game music.mp3")                    
		    elsif soundSetting mod 2 not = 0 then
			drawfillbox(200,500,220,520,red)
			View.Update
			Music.PlayFileStop                        
		    end if
	    end if
	    % exit area 
	    Font.Draw ("Click here to exit", 700, 100, clickanywhere, white)
	    View.Update
	    exit when x>=700 and x<=maxx and y>=100 and y<=160 and button=1 
	end loop        
    % if the instructions button is hovered on
    elsif x >= 300 and x <= 700 and y >= 200 and y <= 300 and button = 0 then
	drawline (xStory + 400, 200, xStory + 400, 300, brightgreen)
	drawline (xStory, 200, xStory, 300, brightgreen)
	drawline (xStory + 400, 200, xStory, 200, brightgreen)
	drawline (xStory + 400, 300, xStory, 300, brightgreen)
    % if the instructions button is clicked on
    elsif x >= 300 and x <= 700 and y >= 200 and y <= 300 and button = 1 then
	drawline (xStory + 400, 200, xStory + 400, 300, yellow)
	drawline (xStory, 200, xStory, 300, yellow)
	drawline (xStory + 400, 200, xStory, 200, yellow)
	drawline (xStory + 400, 300, xStory, 300, yellow)
	% circle animation
	for instructionAnimate : 1 .. 500
	    drawfilloval (maxx div 2, maxy div 2, instructionAnimate, instructionAnimate, black)
	    View.Update
	end for
	delay (100)
	% click anywhere to continue effect on the page
	loop
	    Mouse.Where (x, y, button)
	    Pic.Draw (instructionClock, 100, 25, 0)
	    Font.Draw ("Instructions", 300, 550, menuFont1, brightgreen)
	    Font.Draw ("Click on wires to change their positions", 100, 500, menuFont1, brightgreen)
	    Font.Draw ("Finish the puzzle from your end to the other before the time runs out.", 100, 450, menuFont1, brightgreen)
	    Font.Draw ("Watch out for special challenges in future levels.", 100, 400, menuFont1, brightgreen)
	    Font.Draw ("click anywhere to continue", 800, 30, clickanywhere, white)
	    View.Update
	    exit when button = 1
	end loop
    % if Play button is hovered on
    elsif x >= 300 and x <= 700 and y >= 350 and y <= 450 and button = 0 then
	drawline (xStory + 400, 350, xStory + 400, 450, brightgreen)
	drawline (xStory, 350, xStory, 450, brightgreen)
	drawline (xStory + 400, 350, xStory, 350, brightgreen)
	drawline (xStory + 400, 450, xStory, 450, brightgreen)
    % if Play button is clicked on
    elsif x >= 300 and x <= 700 and y >= 350 and y <= 450 and button = 1 then
	drawline (xStory + 400, 350, xStory + 400, 450, yellow)
	drawline (xStory, 350, xStory, 450, yellow)
	drawline (xStory + 400, 350, xStory, 350, yellow)
	drawline (xStory + 400, 450, xStory, 450, yellow)
	% circle animation to load up the game
	for instructionAnimate : 1 .. 800
	    drawfilloval (maxx div 2, maxy div 2, instructionAnimate, instructionAnimate, blue)
	    View.Update
	end for
	gameLoop := true % allows the game to start if the boolean is true
    % if mouse is anywhere else on the screen
    else
	drawfillbox (0, 0, maxx, maxy, black)
	% words on the buttons
	Font.Draw ("PLAY", 350, 375, menuFont1, green)
	Font.Draw ("INSTRUCTIONS", 350, 225, menuFont1, green)
	Font.Draw ("SETTINGD", 320, 75, menuFont1, green)
	% play
	drawline (xStory + 400, 50, xStory + 400, 150, green)
	drawline (xStory, 50, xStory, 150, green)
	drawline (xStory + 400, 50, xStory, 50, green)
	% instructions
	drawline (xStory + 400, 200, xStory + 400, 300, green)
	drawline (xStory, 200, xStory, 300, green)
	drawline (xStory + 400, 200, xStory, 200, green)
	% about
	drawline (xStory + 400, 350, xStory + 400, 450, green)
	drawline (xStory, 350, xStory, 450, green)
	drawline (xStory + 400, 350, xStory, 350, green)
    end if
    View.Update
    exit when gameLoop = true
end loop

% Grid Drawing
procedure drawGrid
    % White square in grid formation
    grid_y := 100
    for gridY : 1 .. 4
	grid_x := 100
	for gridX : 1 .. 8
	    drawbox (grid_x, grid_y, grid_x + 100, grid_y + 100, black)
	    grid_x += 100
	end for
	grid_y += 100
    end for
    % border
    drawfillbox (0, 500, maxx, maxy, blue)
    drawfillbox (900, 0, maxx, maxy, blue)
    drawfillbox (0, 0, maxx, 100, blue)
    drawfillbox (0, 0, 100, maxy, blue)
    % timer prompt
    Font.Draw ("Time Left: ", 60, maxy - 25, timeFont, white)
    % wire procedure, specific to the certain level
    wires
    % Ending wire
    drawfillbox (910, 440, maxx, 460, 120)
    drawfillbox (910, 447, maxx, 453, 12)
end drawGrid

% Character Drawing
character_x := 70
character_y := 150
procedure drawCharacter
    drawfilloval (character_x, character_y, 15, 15, brightgreen)
    Draw.ThickLine (character_x, character_y + 20, character_x, character_y - 20, 5, brightgreen)
    Draw.ThickLine (character_x - 20, character_y, character_x + 20, character_y, 5, brightgreen)
    drawfilloval (character_x, character_y, 12, 12, brightblue)
    drawfilloval (character_x, character_y, 10, 10, brightgreen)
    drawfilloval (character_x, character_y, 8, 8, brightblue)
    drawfilloval (character_x, character_y, 6, 6, brightgreen)
end drawCharacter

% % creating boxes for hovering and clicking animations
% boxSizeX (1) := 100
% boxSizeY (1) := 100
% for boxesX : 2 .. 8
%     boxSizeX (boxesX) := boxSizeX (boxesX - 1) + 100
% end for
% for boxesY : 2 .. 4
%     boxSizeY (boxesY) := boxSizeY (boxesY - 1) + 100
% end for

% PIPE GAME
if gameLoop = true then
    loop
	% Input from user
	Mouse.Where (x, y, button)
	% Changing the wire direction (changing the variable values)
	% CLICKING
	for rows : 1 .. 4
	    for columns : 1 .. 8
		columnCounter := columns
		% if a certain box is clicked
		if x >= columnCounter * UPPERBOX + 1 and x <= columnCounter * UPPERBOX + 99 and y >= rows * UPPERBOX + 1 and y <= rows * UPPERBOX + 99 and button = 1 then
		    moveCounter := moveCounter + 1
		    % if it is on the second row, move up by adding 8 
		    if rows = 2 then
			columnCounter := columnCounter + 8
		    % if it is on the third row, move up by adding 8
		    elsif rows = 3 then
			columnCounter := columnCounter + 16
		    % if it is on the fourth row, move up by adding 8
		    elsif rows = 4 then
			columnCounter := columnCounter + 24
		    end if
		    % if the pipe has been rotated 4 times, reset the value to the first position
		    if pipeNumber (columnCounter) >= 1 and pipeNumber (columnCounter) < 4 then
			pipeNumber (columnCounter) += 1
			delay (200)
		    elsif pipeNumber (columnCounter) = 4 then
			pipeNumber (columnCounter) := 1
			delay (200)
		    end if
		end if
	    end for
	end for

	% Drawings of background and character
	drawGrid
	drawCharacter

	% tutorial popups at certain times
	% if user has clicked 5 times
	if moveCounter = 5 then
	    loop %click anywhere 
		Mouse.Where(x,y,button)
		drawfillbox (200, 15, 800, 70, 71)
		Font.Draw ("Remember to watch the clock! Your time has started.", 210, 25, tutorialFont, black)
		View.Update                 
		exit when button = 1
	    end loop
	    moveCounter := moveCounter + 1
	% if user has clicked 10 times
	elsif moveCounter = 10 then
	    loop %click anywhere
		Mouse.Where (x,y,button)
		drawfillbox (200, 15, 800, 70, 63)
		Font.Draw ("In future levels watch out for a special challenge!", 210, 25, tutorialFont, black)
		View.Update
		exit when button = 1
	    end loop 
	    moveCounter := moveCounter + 1
	% if the user has moved 10 times at the beginning of level 2, 3, or 4
	elsif moveCounter = 110 or moveCounter = 210 or moveCounter = 310 then
	    loop %click anywhere
		Mouse.Where (x,y,button)
		drawfillbox (200, 15, 800, 70, 63)
		Font.Draw ("VIRUS DETECTED! Your wires changed!", 210, 25, tutorialFont, black)
		View.Update
		exit when button = 1
	    end loop
	    moveCounter := moveCounter + 1
	end if

	% timer starts after first tutorial popup
	if moveCounter > 5 then
	    timer -= 1
	    Font.Draw (intstr (timer div 100), 140, maxy - 25, timeFont, white)
	    % pauses time when second popup appears
	elsif moveCounter = 8 then
	    timer := timer + 0
	end if
	exit when timer = 0 % timer ends

	% resetting the vertical pipes
	if level = 1 then
	    if pipeNumber (5) = 3 then
		pipeNumber (5) := 1
	    end if
	    if pipeNumber (10) = 3 then
		pipeNumber (10) := 1
	    end if
	    if pipeNumber (11) = 3 then
		pipeNumber (11) := 1
	    end if
	    if pipeNumber (14) = 4 then
		pipeNumber (14) := 2
	    end if
	    if pipeNumber (22) = 4 then
		pipeNumber (22) := 2
	    end if
	    if pipeNumber (31) = 3 then
		pipeNumber (31) := 1
	    end if
	    if pipeNumber (32) = 3 then
		pipeNumber (32) := 1
	    end if
	elsif level = 2 then
	    if pipeNumber (1) = 3 then
		pipeNumber (1) := 1
	    end if
	    if pipeNumber (2) = 3 then
		pipeNumber (2) := 1
	    end if
	    if pipeNumber (3) = 3 then
		pipeNumber (3) := 1
	    end if
	    if pipeNumber (11) = 3 then
		pipeNumber (11) := 1
	    end if
	    if pipeNumber (18) = 4 then
		pipeNumber (18) := 2
	    end if
	    if pipeNumber (20) = 3 then
		pipeNumber (20) := 1
	    end if
	    if pipeNumber (21) = 3 then
		pipeNumber (21) := 1
	    end if
	    if pipeNumber (22) = 3 then
		pipeNumber (22) := 1
	    end if
	    if pipeNumber (32) = 3 then
		pipeNumber (32) := 1
	    end if
	elsif level = 3 then
	    if pipeNumber (10) = 3 then
		pipeNumber (10) := 1
	    end if
	    if pipeNumber (4) = 3 then
		pipeNumber (4) := 1
	    end if
	    if pipeNumber (5) = 3 then
		pipeNumber (5) := 1
	    end if
	    if pipeNumber (14) = 4 then
		pipeNumber (14) := 2
	    end if
	    if pipeNumber (22) = 4 then
		pipeNumber (22) := 2
	    end if
	elsif level = 4 then
	    if pipeNumber (9) = 4 then
		pipeNumber (9) := 2
	    end if
	    if pipeNumber (10) = 4 then
		pipeNumber (10) := 2
	    end if
	    if pipeNumber (22) = 4 then
		pipeNumber (22) := 2
	    end if
	    if pipeNumber (31) = 3 then
		pipeNumber (31) := 1
	    end if
	    if pipeNumber (32) = 3 then
		pipeNumber (32) := 1
	    end if
	end if

	% if user passes the level, animation that completes the pipe
	if level = 1 and pipeNumber (1) = 4 and pipeNumber (9) = 2 and pipeNumber (12) = 3 and pipeNumber (4) = 1 and pipeNumber (6) = 4 and pipeNumber (30) = 2 and pipeNumber (5) = 1 and pipeNumber (10) = 1 and pipeNumber (11) = 1 and pipeNumber (14) = 2 and pipeNumber (22) = 2 and pipeNumber (31) = 1 and pipeNumber (32) = 1 then
	Pic.Draw (correctWiresCurved (4), 101, 101, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresCurved (2), 101, 201, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresStraight (1), 201, 201, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresStraight (1), 301, 201, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresCurved (3), 401, 201, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresCurved (1), 401, 101, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresStraight (1), 501, 101, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresCurved (4), 601, 101, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresStraight (2), 601, 201, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresStraight (4), 601, 301, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresCurved (2), 601, 401, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresStraight (1), 701, 401, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresStraight (1), 801, 401, 0)
	delay (100)
	View.Update
	level := 2 %change level number
	for correct1 : 1 .. 89
	    delay (15)
	    drawfillbox (912, 442, 912 + correct1, 458, brightgreen)
	    View.Update
	end for
	cls
	moveCounter := 100 %add 100 to move to the next level and avoid conflicts 

	elsif level = 2 and pipeNumber (1) = 1 and pipeNumber (2) = 1  and pipeNumber (3) = 1  and pipeNumber (4) = 4 and pipeNumber (12) = 3 and pipeNumber (11) = 1 and pipeNumber (10) = 1  and pipeNumber (18) = 2 and pipeNumber (26) = 2 and pipeNumber (27) = 3 and pipeNumber (19) = 1 and pipeNumber (20) = 1 and pipeNumber (21) = 1 and pipeNumber (22) = 1 and pipeNumber (23) = 4 and pipeNumber (31) = 2 and pipeNumber (32) = 1 then
	Pic.Draw (correctWiresStraight (1), 101, 101, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresStraight (1), 201, 101, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresStraight (1), 301, 101, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresCurved (4), 401, 101, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresCurved (3), 401, 201, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresStraight (1), 301, 201, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresCurved (1), 201, 201, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresStraight (2), 201, 301, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresCurved (2), 201, 401, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresCurved (3), 301, 401, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresCurved (1), 301, 301, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresStraight (1), 401, 301, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresStraight (1), 501, 301, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresStraight (1), 601, 301, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresCurved (4), 701, 301, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresCurved (2), 701, 401, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresStraight (1), 801, 401, 0)
	delay (100)
	View.Update
	level := 3 %changes for level 3
	for correct1 : 1 .. 89
	    delay (15)
	    drawfillbox (912, 442, 912 + correct1, 458, brightgreen)
	    View.Update
	end for
	delay (1000)        
	moveCounter := 200 %change for level 3

	elsif level = 3 and pipeNumber (1) = 4 and pipeNumber (9) = 2 and pipeNumber (10) = 1 and pipeNumber (11) = 3 and pipeNumber (3) = 1 and pipeNumber (4) = 1 and pipeNumber (5) = 1 and pipeNumber(6) = 4 and pipeNumber (14) = 2 and pipeNumber (22) = 2 and pipeNumber (30) = 2 and pipeNumber (31) = 3 and pipeNumber (32) = 2 and pipeNumber (23) = 1 and pipeNumber (24) = 4 then
	Pic.Draw (correctWiresCurved (4), 101, 101, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresCurved (2), 101, 201, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresStraight (1), 201, 201, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresCurved (3), 301, 201, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresCurved (1), 301, 101, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresStraight (1), 401, 101, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresStraight (1), 501, 101, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresCurved (4), 601, 101, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresStraight (2), 601, 201, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresStraight (2), 601, 301, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresCurved (2), 601, 401, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresCurved (3), 701, 401, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresCurved (1), 701, 301, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresCurved (4), 801, 301, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresCurved (2), 801, 401, 0)
	delay (100)
	View.Update
	level := 4 %changes for level 3
	for correct1 : 1 .. 89
	    delay (15)
	    drawfillbox (912, 442, 912 + correct1, 458, brightgreen)
	    View.Update
	end for
	delay (1000)
	moveCounter := 300 %changes for level 3

	elsif level = 4 and pipeNumber (1) = 4 and pipeNumber (2) = 1 and pipeNumber (3) = 4 and pipeNumber (9) = 2 and pipeNumber (10) = 2 and pipeNumber (11) = 2 and pipeNumber (12) = 4 and pipeNumber (13) = 1 and pipeNumber (14) = 4 and pipeNumber (17) = 2 and pipeNumber (18) = 3 and pipeNumber (20) = 2 and pipeNumber (21) = 3 and pipeNumber (22) = 2 and pipeNumber (30) = 2 and pipeNumber (31) = 1 and pipeNumber (32) = 1 then
	Pic.Draw (correctWiresCurved (4), 101, 101, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresStraight (2), 101, 201, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresCurved (2), 101, 301, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresCurved (3), 201, 301, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresStraight (2), 201, 201, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresCurved (1), 201, 101, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresCurved (4), 301, 101, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresCurved (2), 301, 201, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresCurved (4), 401, 201, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresCurved (2), 401, 301, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresCurved (3), 501, 301, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresCurved (1), 501, 201, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresCurved (4), 601, 201, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresStraight (2), 601, 301, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresCurved (2), 601, 401, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresStraight (1), 701, 401, 0)
	delay (100)
	View.Update
	Pic.Draw (correctWiresStraight (1), 801, 401, 0)
	delay (100)
	View.Update
	level := 5 %changes to launch the final cutscene
	for correct1 : 1 .. 89
	    delay (15)
	    drawfillbox (912, 442, 912 + correct1, 458, brightgreen)
	    View.Update
	end for
	delay (1000)
    end if
    % whichever comes first, pass or fail
    exit when level = 5 or timer = 0 
    Font.Draw (intstr (timer div 100), 140, maxy - 25, timeFont, white)
    View.Update
end loop
end if

if level = 5 then %if all levels were passed
    for circleAnimation:1..700
	drawfilloval(maxx div 2, maxy div 2, circleAnimation,circleAnimation,white)
    end for
    for blackBorders : 1 .. 300 %cutscene borders
	Draw.ThickLine (maxx - 700 - blackBorders, maxy, maxx, maxy - blackBorders + 40, 8, black)
	Draw.ThickLine (700 + blackBorders, 0, 0, blackBorders - 40, 8, black)
	View.Update
	delay (1)
    end for
    character_x := 220
    character_y := 220
    drawCharacter
    Font.Draw("You beat the Aliens!",100,250,menuFont1,black)
    Pic.Draw(ufoShip,600,200,0)
    View.Update
    delay(250)
    Pic.Draw(explosionImg, 602, 190, 0)
    View.Update
elsif timer = 0 then %if user couldn't complete before time ran out
    for blackBorders : 1 .. 300 %cutscene borders
	Draw.ThickLine (maxx - 700 - blackBorders, maxy, maxx, maxy - blackBorders + 40, 8, black)
	Draw.ThickLine (700 + blackBorders, 0, 0, blackBorders - 40, 8, black)
	View.Update
	delay (1)
    end for
    character_x := 220
    character_y := 220
    drawCharacter
    Font.Draw("Better luck next time",100,250,menuFont1,black)
    Pic.Draw(ufoShip,600,200,0)
    View.Update
    delay(250)
    Pic.Draw(explosionImg,222,222,0)
    View.Update
end if

% saving highscores:
open : file, pathName, get
get : file, check
close : file
if timer > check then
    open : file, pathName, put
    put : file, timer div 100
    close : file
end if

open : prevHigh, "Highscore.txt", get 
get : prevHigh, highscore 
put "                              HIGH SCORE: ", highscore
    









