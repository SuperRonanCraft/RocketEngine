///@desc Draw the correct sprites for each animation state
///@arg state The state to use

var overwrite = false;

var state = argument[0];
var map = playerMap;

switch (state) {
	case ANIMATIONSTATE.TRAPPED:
		map[? PLAYER_MAP.CURRENT_SPRITE] = sPlayer_trapped;
		break;
	case ANIMATIONSTATE.TECHED:
		overwrite = true;
		if (scSpecialAnimation(sPlayer_tech, 0))
			map[? PLAYER_MAP.ANIMATION_STATE] = PLAYERSTATE.NORMAL;
		break;
	case ANIMATIONSTATE.KNOCKBACK2:
		map[? PLAYER_MAP.CURRENT_SPRITE] = sPlayer_knockBack2;
		break;
	case ANIMATIONSTATE.KNOCKBACK:
		map[? PLAYER_MAP.CURRENT_SPRITE] = sPlayer_knockBack;
		break;
	case ANIMATIONSTATE.SLEEPING:
		overwrite = true;
		scSpecialAnimation(sPlayer_dead1, 0);
		break;
	case ANIMATIONSTATE.WAKING:
		overwrite = true;
		if (scSpecialAnimation(sPlayer_dead1, 2))
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
	scFlash(flash_alpha, flash_color, facing * image_xscale, image_yscale, sprite, sprite_img, x, y);
}



