pico-8 cartridge // http://www.pico-8.com
version 36
__lua__
-- pico defense
-- by widearchshark

function _init()
	cinit = init_menu
	cupdate = update_menu
	cdraw = draw_menu
	
	cinit()
end

function _update()
	cupdate()
end

function _draw()
	cdraw()
end

-->8
-- main menu

function init_menu()
	title = "pico defense"
	title_colour = 1
	
	menu_options = {
		"new game",
		"options",
		"help"
	}
	
	option_selected = 1
end

function update_menu()
	title_colour += 1
	if (title_colour > 15) title_colour = 1
	
	if(btnp(⬇️)) then
		sfx(0)
		option_selected += 1
	elseif(btnp(⬆️)) then
		sfx(0)
		option_selected -= 1
	end
	
	option_selected = mid(1,option_selected,#menu_options)
	
	if(btnp(❎)) then
		sfx(1)
		if(option_selected == 1) then
--			stop()
		elseif(option_selected == 2) then
		end
	end
end

function draw_menu()
	yoffset = 25
	
	cls(3)
	
	centre_text(title,8,title_colour)
	
	for i = 1, #menu_options do
		local col = 7
		if (i == option_selected) col = 2
		centre_text(menu_options[i], i*10+yoffset, col)
	end
	
	spr(1,30,option_selected*10+yoffset-2)
	
	centre_text("⬆️ ⬇️ to select", 110, 7)
	centre_text("❎ to confirm", 120, 7)
end

function centre_text(str, sy, col)
	local sx = 64 - flr((4*#str)/2)
	print(str, sx, sy, col)
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000022000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000022200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000022220000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000022200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000022000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
00080000110500d0000d0000d0000e000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000800002905000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
