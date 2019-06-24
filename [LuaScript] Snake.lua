-- things that can be edited in menu
local Board = {};
local OptionsRef = gui.Reference("MISC", "AUTOMATION", "OTHER");
local DIMENSIONS_SLIDER = gui.Slider(OptionsRef, "DIMENSIONS", "Board size", 16, 4, 30);
local BOX_SIZE_SLIDER = gui.Slider(OptionsRef, "SIZE_SLIDER", "Box size", 25, 5, 50);
local MOVE_DLEAY_SLIDER = gui.Slider(OptionsRef, "MOVE_DELAY", "Snake move delay", 0.1, 0.05, 0.2);
local UP_KEY = gui.Keybox(OptionsRef, "UP_KEY", "Move Up", 87);
local DOWN_KEY = gui.Keybox(OptionsRef, "DOWN_KEY", "Move Down", 83);
local LEFT_KEY = gui.Keybox(OptionsRef, "LEFT_KEY", "Move Left", 65);
local RIGHT_KEY = gui.Keybox(OptionsRef, "RIGHT_KEY", "Move Right", 68);

local BOARD_SIZE = DIMENSIONS_SLIDER:GetValue();
local BOX_SIZE = BOX_SIZE_SLIDER:GetValue();
local MOVE_DELAY = MOVE_DLEAY_SLIDER:GetValue();
local UpKey = UP_KEY:GetValue();
local DownKey = DOWN_KEY:GetValue();
local LeftKey = LEFT_KEY:GetValue();
local RightKey = RIGHT_KEY:GetValue();
local LastTime = common.Time();
local Snake_Length;
local Direction;
local Started;
local AppleOnBoard;

-- things that dont need to be edited
local MAIN_WINDOW_X, MAIN_WINDOW_Y = 200, 100;
local is_dragging, is_placing = false;
local dragging_offset_x, dragging_offset_y;
local END_FONT = draw.CreateFont("Tahoma", 60, 60);
Started = false;
Crashed = false;
AppleOnBoard = false;

-- initialise board 
function NewBoard(BOARD_SIZE)
	for x = 1, BOARD_SIZE do
		Board[x] = {}
		for y = 1, BOARD_SIZE do
			Board[x][y] = 0;
		end
	end
	Direction = 'u'
	Board[math.floor(BOARD_SIZE / 2)][math.floor(BOARD_SIZE / 2)] = Direction;
	Snake_Length = 0;
end


function Start()
	if (input.IsButtonPressed(32)) then
		Started = true
		Crashed = false
		AppleOnBoard = false
		NewBoard(BOARD_SIZE);
		SpawnApple();
	end
	if Started == false then
		draw.SetFont(END_FONT);
		draw.Text(0, 0, "Choose the board size and dimensions then press space to start");	
		draw.Text(0, 70, "Box size can be changed during play but Dimentions CAN'T be");
	elseif Crashed == true then	
		EndGameWords();
		return
	elseif Started == true then
		DrawMainBox();
		DrawSnake();
	end
end	
	

-- main box drawing
function DrawMainBox()
	draw.Color(100, 100, 100, 230);
	draw.FilledRect(MAIN_WINDOW_X, MAIN_WINDOW_Y, MAIN_WINDOW_X + (BOX_SIZE * BOARD_SIZE), MAIN_WINDOW_Y + (BOX_SIZE * BOARD_SIZE));
	for x = 0, BOARD_SIZE -1, 1 do	
		for y = 0, BOARD_SIZE -1, 1 do
			draw.Color(gui.GetValue("clr_gui_window_logo1"));
			draw.OutlinedRect(MAIN_WINDOW_X + (BOX_SIZE * x), MAIN_WINDOW_Y + (BOX_SIZE * y) ,MAIN_WINDOW_X + (BOX_SIZE * (x + 1)), MAIN_WINDOW_Y + (BOX_SIZE * (y + 1)));	
		end
	end
	draw.Color(100,100,100,255);
	draw.FilledRect(MAIN_WINDOW_X - BOX_SIZE, MAIN_WINDOW_Y - BOX_SIZE, MAIN_WINDOW_X, MAIN_WINDOW_Y + (BOX_SIZE * BOARD_SIZE) + BOX_SIZE);
	draw.FilledRect(MAIN_WINDOW_X + (BOX_SIZE * BOARD_SIZE), MAIN_WINDOW_Y - BOX_SIZE, MAIN_WINDOW_X + (BOX_SIZE * BOARD_SIZE) + BOX_SIZE, MAIN_WINDOW_Y + (BOX_SIZE * BOARD_SIZE) + BOX_SIZE);
	draw.FilledRect(MAIN_WINDOW_X, MAIN_WINDOW_Y - BOX_SIZE, MAIN_WINDOW_X + (BOX_SIZE * BOARD_SIZE), MAIN_WINDOW_Y);
	draw.FilledRect(MAIN_WINDOW_X, MAIN_WINDOW_Y + (BOX_SIZE * BOARD_SIZE), MAIN_WINDOW_X + (BOX_SIZE * BOARD_SIZE), MAIN_WINDOW_Y + (BOX_SIZE * BOARD_SIZE) + BOX_SIZE);
	
	local mouse_x, mouse_y = input.GetMousePos();
	local left_mouse_down = input.IsButtonDown(1);
	-- cpp from ShadyRetard
	if (is_dragging == true and left_mouse_down == false) then
		is_dragging = false;
		dragging_offset_x = 0;
		dragging_offset_y = 0;
	end
	if (left_mouse_down == true) then
		dragHandler();
	end
	-- movement
	-- update keys
	UpKey = UP_KEY:GetValue();
	DownKey = DOWN_KEY:GetValue();
	LeftKey = LEFT_KEY:GetValue();
	RightKey = RIGHT_KEY:GetValue();
	
	if UpKey ~= 0 then
		if input.IsButtonPressed(UpKey) then
			if Direction ~= 'd' then
				Direction = 'u'
			end
		end
	end
	if DownKey ~= 0 then
		if input.IsButtonPressed(DownKey) then
			if Direction ~= 'u' then
				Direction = 'd'
			end
		end
	end
	if LeftKey ~= 0 then
		if input.IsButtonPressed(LeftKey) then
			if Direction ~= 'r' then
				Direction = 'l'
			end
		end
	end
	if RightKey ~= 0 then
		if input.IsButtonPressed(RightKey) then
			if Direction ~= 'l' then
				Direction = 'r'
			end
		end
	end
	
	-- timer by ShadyRetard
	MOVE_DELAY = MOVE_DLEAY_SLIDER:GetValue();
	local CurrentTime = common.Time();
	if CurrentTime - LastTime < MOVE_DELAY then
		return
	end
	LastTime = CurrentTime;
	Movement();
end

function DrawSnake()
	for x = 1, BOARD_SIZE, 1 do
		for y = 1, BOARD_SIZE, 1 do
			if (Board[x][y] == 'u' or Board[x][y] == 'd' or Board[x][y] == 'l' or Board[x][y] == 'r' or Board[x][y] == 'a') then
				if Board[x][y] == 'u' then
					draw.Color(0,0,255,255);
					draw.FilledRect(MAIN_WINDOW_X + (BOX_SIZE / 4) + ((x-1) * BOX_SIZE), MAIN_WINDOW_Y + (BOX_SIZE / 4) + ((y-1) * BOX_SIZE), MAIN_WINDOW_X + ((BOX_SIZE / 4)* 3) + ((x-1) * BOX_SIZE),  MAIN_WINDOW_Y + ((BOX_SIZE / 4)* 3) + ((y-1) * BOX_SIZE));
				end
				
				if Board[x][y] == 'd' then
					draw.Color(0,0,255,255);
					draw.FilledRect(MAIN_WINDOW_X + (BOX_SIZE / 4) + ((x-1) * BOX_SIZE), MAIN_WINDOW_Y + (BOX_SIZE / 4) + ((y-1) * BOX_SIZE), MAIN_WINDOW_X + ((BOX_SIZE / 4)* 3) + ((x-1) * BOX_SIZE),  MAIN_WINDOW_Y + ((BOX_SIZE / 4)* 3) + ((y-1) * BOX_SIZE));
				end
				
				if Board[x][y] == 'l' then
					draw.Color(0,0,255,255);
					draw.FilledRect(MAIN_WINDOW_X + (BOX_SIZE / 4) + ((x-1) * BOX_SIZE), MAIN_WINDOW_Y + (BOX_SIZE / 4) + ((y-1) * BOX_SIZE), MAIN_WINDOW_X + ((BOX_SIZE / 4)* 3) + ((x-1) * BOX_SIZE),  MAIN_WINDOW_Y + ((BOX_SIZE / 4)* 3) + ((y-1) * BOX_SIZE));
				end
				
				if Board[x][y] == 'r' then
					draw.Color(0,0,255,255);
					draw.FilledRect(MAIN_WINDOW_X + (BOX_SIZE / 4) + ((x-1) * BOX_SIZE), MAIN_WINDOW_Y + (BOX_SIZE / 4) + ((y-1) * BOX_SIZE), MAIN_WINDOW_X + ((BOX_SIZE / 4)* 3) + ((x-1) * BOX_SIZE),  MAIN_WINDOW_Y + ((BOX_SIZE / 4)* 3) + ((y-1) * BOX_SIZE));
				end	
				
				if Board[x][y] == 'a' then
					draw.Color(255,0,0,255);
					draw.FilledRect(MAIN_WINDOW_X + (BOX_SIZE / 4) + ((x-1) * BOX_SIZE), MAIN_WINDOW_Y + (BOX_SIZE / 4) + ((y-1) * BOX_SIZE), MAIN_WINDOW_X + ((BOX_SIZE / 4)* 3) + ((x-1) * BOX_SIZE),  MAIN_WINDOW_Y + ((BOX_SIZE / 4)* 3) + ((y-1) * BOX_SIZE));
				end
				
			elseif (Board[x][y] > 0) then
				draw.Color(0,255,0,(Board[x][y] / Snake_Length) * 255);
				draw.FilledRect(MAIN_WINDOW_X + (BOX_SIZE / 4) + ((x-1) * BOX_SIZE), MAIN_WINDOW_Y + (BOX_SIZE / 4) + ((y-1) * BOX_SIZE), MAIN_WINDOW_X + ((BOX_SIZE / 4)* 3) + ((x-1) * BOX_SIZE),  MAIN_WINDOW_Y + ((BOX_SIZE / 4)* 3) + ((y-1) * BOX_SIZE));
			end
		end
	end
end


-- round slider values
function RoundSliders()
	local RoundSize = BOX_SIZE_SLIDER:GetValue()
	local RoundDim = DIMENSIONS_SLIDER:GetValue()
	
	local SizeDec = RoundSize % 1;
	local DimDec = RoundDim % 1;
	
	if (DimDec >= 0.5) then
		RoundDim = RoundDim - DimDec;
		RoundDim = RoundDim + 1;
	elseif (DimDec < 0.5) then
		RoundDim = RoundDim - DimDec;
	end	
	
	if (SizeDec >= 0.5) then
		RoundSize = RoundSize - SizeDec;
		RoundSize = RoundSize + 1;
	elseif (SizeDec < 0.5) then
		RoundSize = RoundSize - SizeDec;
	end
	
	BOX_SIZE = RoundSize;
	BOARD_SIZE = RoundDim;
	
end

-- dragging by ShadyRetard
function dragHandler()
    local mouse_x, mouse_y = input.GetMousePos();
    if (is_dragging == true) then
        MAIN_WINDOW_X = mouse_x - dragging_offset_x;
        MAIN_WINDOW_Y = mouse_y - dragging_offset_y;
        return;
    end

    if (mouse_x >= MAIN_WINDOW_X - BOX_SIZE and mouse_x <= MAIN_WINDOW_X + (BOX_SIZE * BOARD_SIZE) + BOX_SIZE and mouse_y >= MAIN_WINDOW_Y - BOX_SIZE and mouse_y <= MAIN_WINDOW_Y) then
        is_dragging = true;
        dragging_offset_x = mouse_x - MAIN_WINDOW_X;
        dragging_offset_y = mouse_y - MAIN_WINDOW_Y;
        return;
    end
end


function Movement();
	local MovedHead = false
	for x = 1, BOARD_SIZE, 1 do
		for y = 1, BOARD_SIZE, 1 do
			if ((Board[x][y] == 'u' or Board[x][y] == 'd' or Board[x][y] == 'l' or Board[x][y] == 'r' )) then
				Board[x][y] = Direction;
				if MovedHead == false then
					if Board[x][y] == 'u' then
						if (Board[x][y-1] == 'a') then
							AppleOnBoard = false;
							Snake_Length = Snake_Length + 1;
							SpawnApple();
							Board[x][y] = Snake_Length;
							Board[x][y-1] = 'u';
							Direction = 'u';
							MovedHead = true
						elseif (y == 1) or (Board[x][y-1] > 0) then
							Crashed = true
						else 
							Board[x][y] = Snake_Length;
							Board[x][y-1] = 'u';
							Direction = 'u';
							MovedHead = true
						end
					end
					if Board[x][y] == 'd' then
						if (Board[x][y+1] == 'a') then
							AppleOnBoard = false;
							Snake_Length = Snake_Length + 1;
							SpawnApple();
							Board[x][y] = Snake_Length;
							Board[x][y+1] = 'd';
							Direction = 'd';
							MovedHead = true
						elseif (y == BOARD_SIZE ) or (Board[x][y+1] > 0) then
							Crashed = true
						else 
							Board[x][y] = Snake_Length;
							Board[x][y+1] = 'd';
							Direction = 'd';
							MovedHead = true
						end
					end
					if Board[x][y] == 'l' then
						if (x == 1) then
							Crashed = true
						elseif (Board[x-1][y] == 'a') then
							AppleOnBoard = false;
							Snake_Length = Snake_Length + 1;
							SpawnApple();
							Board[x][y] = Snake_Length;
							Board[x-1][y] = 'l';
							Direction = 'l';
							MovedHead = true
						elseif (x == 1) or (Board[x-1][y] > 0) then
							Crashed = true
						else 
							Board[x][y] = Snake_Length;
							Board[x-1][y] = 'l';
							Direction = 'l';
							MovedHead = true
						end
					end
					if Board[x][y] == 'r' then
						if (x == BOARD_SIZE) then
							Crashed = true
						elseif (Board[x+1][y] == 'a') then
							AppleOnBoard = false;
							Snake_Length = Snake_Length + 1;
							SpawnApple();
							Board[x][y] = Snake_Length;
							Board[x+1][y] = 'r';
							Direction = 'r';
							MovedHead = true
						elseif (x == BOARD_SIZE ) or (Board[x+1][y] > 0) then
							Crashed = true
						else 
							Board[x][y] = Snake_Length;
							Board[x+1][y] = 'r';
							Direction = 'r';
							MovedHead = true
						end
					end	
				end
			elseif Board[x][y] == 'a' then
			
			elseif Board[x][y] >= 1 then
				Board[x][y] = Board[x][y] - 1;
			end
		end
	end
end


function SpawnApple()
	while AppleOnBoard == false do
		x= math.random(1, BOARD_SIZE)
		y= math.random(1, BOARD_SIZE)
		if Board[x][y] == 0 then
			Board[x][y] = 'a'
			AppleOnBoard = true
			print("spawned apple");
		end
	end
end
	

function EndGameWords()
	draw.SetFont(END_FONT);
	draw.Color(gui.GetValue("clr_gui_window_logo1"));
	draw.Text(0, 0, "You have crashed, your score was : " .. (Snake_Length + 1));
	draw.Text(0, 50, "Hold SPACE to retry");
end
	
callbacks.Register("Draw", RoundSliders); 
callbacks.Register("Draw", Start);
