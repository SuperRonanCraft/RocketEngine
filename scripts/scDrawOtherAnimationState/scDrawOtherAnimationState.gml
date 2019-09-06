///@desc Draw the correct sprites for each animation state
///@arg state The state to use

var overwrite = false;

var state = argument[0];
var map = player_map;

switch (state) {
	case ANIMATIONSTATE.TRAPPED:
		map[? PLAYER_MAP.CURRENT_SPRITE] = characterSprites[? ANIMATIONSTATE.TRAPPED];
		break;
	case ANIMATIONSTATE.TECHED:
		overwrite = true;
		if (scSpecialAnimation(characterSprites[? ANIMATIONSTATE.TECHED], 0))
			map[? PLAYER_MAP.ANIMATION_STATE] = PLAYERSTATE.NORMAL;
		break;
	case ANIMATIONSTATE.KNOCKBACK2:
		map[? PLAYER_MAP.CURRENT_SPRITE] = characterSprites[? ANIMATIONSTATE.KNOCKBACK2];
		break;
	case ANIMATIONSTATE.KNOCKBACK:
		map[? PLAYER_MAP.CURRENT_SPRITE] = characterSprites[? ANIMATIONSTATE.KNOCKBACK];
		break;
	case ANIMATIONSTATE.SLEEPING:
		overwrite = true;
		scSpecialAnimation(characterSprites[? ANIMATIONSTATE.DEAD], 0);
		break;
	case ANIMATIONSTATE.WAKING:
		overwrite = true;
		if (scSpecialAnimation(characterSprites[? ANIMATIONSTATE.DEAD], 2))
			map[? PLAYER_MAP.ANIMATION_STATE] = PLAYERSTATE.NORMAL;
		break;
}

//draw sprite normally
if (!overwrite) {
	map[? PLAYER_MAP.ANIMATION_VAR] += image_speed * time_dialation;
	var sprite = map[? PLAYER_MAP.CURRENT_SPRITE];
	var sprite_img = floor(map[? PLAYER_MAP.ANIMATION_VAR]);
	draw_sprite_ext(sprite, sprite_img, x, y, 
		facing * image_xscale, image_yscale, 0, c_white, image_alpha);
	scFlash(map[? PLAYER_MAP.FLASH_ALPHA], map[? PLAYER_MAP.FLASH_COLOR], 
		facing * image_xscale, image_yscale, sprite, sprite_img, x, y);
}



