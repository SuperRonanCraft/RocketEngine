///@desc Draw the correct sprites for each animation state
///@arg state The state to use

var overwrite = false;

var state = argument[0];
var map = playerMap;

switch (state) {
	case ANIMATIONSTATE.DEAD:
		overwrite = true;
		scSpecialAnimation(sPlayer_dead1, 0);
		break;
	case ANIMATIONSTATE.DEAD2:
		overwrite = true;
		scSpecialAnimation(sPlayer_dead2, 0);
		break;
	case ANIMATIONSTATE.DEADLASER:
		overwrite = true;
		scSpecialAnimation(sPlayer_deadLaser,0);
		break;
	case ANIMATIONSTATE.DEADFROZEN:
		overwrite = true;
		scSpecialAnimation(sPlayer_deadFrozen,0);
		break;
	case ANIMATIONSTATE.WALKING:
		map[? PLAYER_MAP.CURRENT_SPRITE] = sPlayer_walk;	
		break;	
	case ANIMATIONSTATE.RISING:
		map[? PLAYER_MAP.CURRENT_SPRITE] = sPlayer_rise;	
		break;	
	case ANIMATIONSTATE.SLIDING:
		map[? PLAYER_MAP.CURRENT_SPRITE] = sPlayer_walkend;	
		break;	
	case ANIMATIONSTATE.FALLING:
        map[? PLAYER_MAP.CURRENT_SPRITE] = sPlayer_fall;	
		break;
    case ANIMATIONSTATE.STANDING:
	default:
        map[? PLAYER_MAP.CURRENT_SPRITE] = sPlayer_idle;
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



