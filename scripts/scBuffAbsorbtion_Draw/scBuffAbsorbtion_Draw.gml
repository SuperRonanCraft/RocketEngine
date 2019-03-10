///@desc The "Absorbtion" Buff Draw event
///@arg owner Owner of buff
///@arg buff Parent Buff DS Map

var owner = argument0;

scFlash(image_alpha / 2, c_gray, (facing * image_xscale) * 1.2, image_yscale * 1.2, playerMap[? PLAYER_MAP.CURRENT_SPRITE],
	floor(playerMap[? PLAYER_MAP.ANIMATION_VAR]), x, y);