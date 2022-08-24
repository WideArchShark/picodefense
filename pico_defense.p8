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
	tcol = 2
	menu_offset = 30
	
	menu_items = {
		"new game",
		"options",
		"help",
		"high scores"
	}
	
	item_selected = 1
end

function update_menu()
	tcol += 1
	if (tcol > 15) then
		tcol = 2
	end
	
	if (transitioning) then
		return
	end
	
	if(btnp(⬇️)) then
		sfx(0)
		item_selected += 1
	elseif(btnp(⬆️)) then
		sfx(0)
		item_selected -= 1
	end
	
	item_selected = mid(1, item_selected, #menu_items)
	
	if(btnp(❎)) then
		sfx(1)
		if(item_selected == 1) then
			change_state(init_game,update_game,draw_game)
		end
	end
end

function draw_menu()
	tcls(1)
	centre_text("pico defense",1,tcol)
	
	
	for i = 1, #menu_items do
		item_col = 7
		if (i == item_selected) item_col = 10
		centre_text(menu_items[i], 10*i+menu_offset, item_col)
	end
	
	spr(1,35,10*item_selected+menu_offset-1)
	
	centre_text("⬆️ / ⬇️ select",100,7)
	centre_text("❎ to confirm",110,7)
end

function centre_text(str, sy, col)
	local sx = 64 - flr((#str*4)/2)
	print(str,sx,sy,col)
end
-->8
-- game state
function init_game()
end

function update_game()
end

function draw_game()
	tcls(1)
	map(0,0,0,0,16,12)
	centre_text("♥100 $1000 w:1/10",1,7)
end
-->8
-- transition state

function transition_init()	
	transitioning = true
	clipy = 0
end

function transition_update()
	-- warning: make sure the update
	-- states in the two states are
	-- not running 'transition_states'
	-- if 'transitioning == true'
	aupdate()
	nupdate()
	clipy += 4
	if (clipy > 128) end_transition()
end

function end_transition()
		cinit = ninit
		cupdate = nupdate
		cdraw = ndraw
		clip()
		transitioning = false
end

function transition_draw()
 cls()
	ndraw()
	clip(0, clipy, 128, 128)
	adraw()	
end


function change_state(ninit1, nupdate1, ndraw1)
	ainit = cinit
	aupdate = cupdate
	adraw = cdraw
	
	ninit = ninit1
	nupdate = nupdate1
	ndraw = ndraw1
	
	cinit = transition_init
	cupdate = transition_update
	cdraw = transition_draw
		
	cinit()
	ninit()
end

function tcls(col)
	rectfill(0, 0, 128, 128, col)
end
__gfx__
00000000a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000aa0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700aaa000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000aaaa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000aaa000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700aa0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
33333333333333333444444334444443344444433333333333333333000000000000000000000000000000000000000000000000000000000000000000000000
33333333444443443443444333444444444444433343444444444433000000000000000000000000000000000000000000000000000000000000000000000000
33333333444444443444444334444444444344333444444444444443000000000000000000000000000000000000000000000000000000000000000000000000
33333333444444443444444334434444444444433444434444344443000000000000000000000000000000000000000000000000000000000000000000000000
33333333444444443444443334444444444444433444444444444443000000000000000000000000000000000000000000000000000000000000000000000000
33333333444434443344444334444444444444433344444444444443000000000000000000000000000000000000000000000000000000000000000000000000
33333333434444443444444333444444443444333444444444443443000000000000000000000000000000000000000000000000000000000000000000000000
33333333333333333444444333333333333333333443444334444433000000000000000000000000000000000000000000000000000000000000000000000000
33bbbb33333333330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3bbbbbb3333a33330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3bbbbbb333a8a3330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3bbbbbb3333a33330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
33bbbb33333b33330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
33344333333b33330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
33344333333333330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
33444433333333330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
1010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1010201010101010102010101020101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1010101010201010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1010151111111610102110101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1111141010101210101015111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1010101010101210201012101021101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1020101020101210101012101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1010101010101210101012211010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1010101010101311111114101020101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2110101010211010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1010201010101010211010211010211000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
000200000d0500d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000600000e05013050160501a05000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
