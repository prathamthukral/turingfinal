% PRATHAM THUKRAL
% ICS 201 - 09
% June 21,2016
% INFO: This is a pipe/plumber game which will fight a virus once the wires are connected

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
% timer var is to count down for the level
% timeFont is used to display how much time the person has left
% There are 12 different picture types, each one is unique and uses a different file Name
% columnCounter counts the column the wire is in

% var declarations
var x, y, button : int
var rowNum : int
var moveCounter : int := 1
var tutorialFont : int := Font.New ("serif:18")
var grid_x,grid_y : int := 0
var character_x, character_y : int
var boxSizeX : array 1 .. 8 of int
var boxSizeY : array 1 .. 4 of int
const UPPERBOX := 100
var timer : int := 10000
var timeFont : int := Font.New ("serif:14")
var columnCounter : int
var pipeNumber : array 1 .. 32 of int

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

var blockedWire: int := Pic.FileNew ("blocked wire.jpg")

% makes all pipeNumber variables in the array equal to 1
for changerVar : 1 .. 32
    randint (pipeNumber (changerVar), 1, 4)
end for

% Wire drawing for Level 1
procedure wires
grid_x := 101
grid_y := 101
    
    % Virus that switches 10 wires randomly
    if moveCounter=10 then
	for virus:1..10
	    randint(pipeNumber(Rand.Int(1,32)),1,4)
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
end wires

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
    % wires
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

% creating boxes for hovering and clicking animations
boxSizeX (1) := 100
boxSizeY (1) := 100
for boxesX : 2 .. 8
    boxSizeX (boxesX) := boxSizeX (boxesX - 1) + 100
end for
for boxesY : 2 .. 4
    boxSizeY (boxesY) := boxSizeY (boxesY - 1) + 100
end for

% PIPE GAME
loop

    % Input from user
    Mouse.Where (x, y, button)

    % Changing the wire direction
    % CLICK
    for rows : 1 .. 4
	for columns : 1 .. 8
	    columnCounter := columns
	    if x >= columnCounter * UPPERBOX + 1 and x <= columnCounter * UPPERBOX + 99 and y >= rows * UPPERBOX + 1 and y <= rows * UPPERBOX + 99 and button = 1 then
		moveCounter := moveCounter + 1
		if rows = 2 then
		    columnCounter := columnCounter + 8 %changes row 1 to row 2
		elsif rows = 3 then
		    columnCounter := columnCounter + 16 %changes row 2 to row 3
		elsif rows = 4 then
		    columnCounter := columnCounter + 24 %changes row 3 to row 4
		end if
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

    % Random wire change level 2 challenge
    if moveCounter = 10 then
	drawfillbox (200, 200, 800, 400, red)
	Font.Draw ("VIRUS DETECTED! Your wires changed!", 305, 300, tutorialFont, brightwhite)
	View.Update
	delay (1300)
	moveCounter := moveCounter + 1
	cls
    end if

    % resetting the vertical pipes
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

    % if user passes the level
    if pipeNumber (1) = 4 and pipeNumber (9) = 2 and pipeNumber (10) = 1 and pipeNumber (11) = 3 and pipeNumber (3) = 1 and pipeNumber (4) = 1 and pipeNumber (5) = 1 and pipeNumber(6) = 4 and pipeNumber (14) = 2 and pipeNumber (22) = 2 and pipeNumber (30) = 2 and pipeNumber (31) = 3 and pipeNumber (32) = 2 and pipeNumber (23) = 1 and pipeNumber (24) = 4 then
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
	
	% Ending pipe animation
	for correct3 : 1 .. 89
	    delay (15)
	    drawfillbox (912, 442, 912 + correct3, 458, brightgreen)
	    View.Update
	end for
    end if
exit when pipeNumber (1) = 4 and pipeNumber (9) = 2 and pipeNumber (10) = 1 and pipeNumber (11) = 3 and pipeNumber (3) = 1 and pipeNumber (4) = 1 and pipeNumber (5) = 1 and pipeNumber(6) = 4 and pipeNumber (14) = 2 and pipeNumber (22) = 2 and pipeNumber (30) = 2 and pipeNumber (31) = 3 and pipeNumber (32) = 2 and pipeNumber (23) = 1 and pipeNumber (24) = 4 
timer-=1
Font.Draw (intstr (timer div 100), 140, maxy - 25, timeFont, white)
View.Update
end loop
