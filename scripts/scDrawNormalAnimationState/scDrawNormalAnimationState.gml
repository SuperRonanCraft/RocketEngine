///@desc Draw the correct sprites for each animation state
///@arg state The state to use
function scDrawNormalAnimationState() {

	var overwrite = false;

	var state = argument[0];
	var map = player_map;

	switch (state) {
		case ANIMATIONSTATE.DEAD:
			overwrite = true;
			scSpecialAnimation(characterSprites[? ANIMATIONSTATE.DEAD], 0);
			break;
		case ANIMATIONSTATE.DEAD2:
			overwrite = true;
			scSpecialAnimation(characterSprites[? ANIMATIONSTATE.DEAD2], 0);
			break;
		case ANIMATIONSTATE.DEADLASER:
			overwrite = true;
			scSpecialAnimation(characterSprites[? ANIMATIONSTATE.DEADLASER],0);
			break;
		case ANIMATIONSTATE.DEADFROZEN:
			overwrite = true;
			scSpecialAnimation(characterSprites[? ANIMATIONSTATE.DEADFROZEN],0);
			break;
		case ANIMATIONSTATE.WALKING:
			map[? PLAYER_MAP.CURRENT_SPRITE] = characterSprites[? ANIMATIONSTATE.WALKING];	
			break;	
		case ANIMATIONSTATE.RISING:
			map[? PLAYER_MAP.CURRENT_SPRITE] = characterSprites[? ANIMATIONSTATE.RISING];		
			break;	
		case ANIMATIONSTATE.SLIDING:
			map[? PLAYER_MAP.CURRENT_SPRITE] = characterSprites[? ANIMATIONSTATE.SLIDING];	
			break;	
		case ANIMATIONSTATE.FALLING:
	        map[? PLAYER_MAP.CURRENT_SPRITE] = characterSprites[? ANIMATIONSTATE.FALLING];	
			break;
	    case ANIMATIONSTATE.STANDING:
		default:
	        map[? PLAYER_MAP.CURRENT_SPRITE] = characterSprites[? ANIMATIONSTATE.STANDING];
	        break;
	}

	//draw sprite normally
	if (!overwrite) {
		map[? PLAYER_MAP.ANIMATION_VAR] += image_speed * time_dialation;
		var sprite = map[? PLAYER_MAP.CURRENT_SPRITE];
		var sprite_img = floor(map[? PLAYER_MAP.ANIMATION_VAR]);
		draw_sprite_ext(sprite, sprite_img, x, y, 
			facing * image_xscale, image_yscale, 0, color_overlay, image_alpha);
		scFlash(map[? PLAYER_MAP.FLASH_ALPHA], map[? PLAYER_MAP.FLASH_COLOR], 
			facing * image_xscale, image_yscale, sprite, sprite_img, x, y);
	}






}
