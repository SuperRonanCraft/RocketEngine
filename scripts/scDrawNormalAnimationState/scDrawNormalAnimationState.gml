///@desc Draw the correct sprites for each animation state
///@arg state The state to use

var overwrite = false;

var state = argument[0];

switch (state) {
	case ANIMATIONSTATE.DEAD:
		overwrite = true;
		scSpecialAnimation(sPlayer_dead1, 0);
		break;
	case ANIMATIONSTATE.WALKING:
		currentSprite = sPlayer_walk;	
		break;	
	case ANIMATIONSTATE.RISING:
		currentSprite = sPlayer_rise;	
		break;	
	case ANIMATIONSTATE.SLIDING:
		currentSprite = sPlayer_walkend;	
		break;	
	case ANIMATIONSTATE.FALLING:
        currentSprite = sPlayer_fall;	
		break;
    case ANIMATIONSTATE.STANDING:
	default:
        currentSprite = sPlayer_idle;
        break;
}

//draw sprite normally
if (!overwrite) {
	animationVar += image_speed * time_dialation;
	var sprite = currentSprite;
	var sprite_img = floor(animationVar);
	draw_sprite_ext(sprite, sprite_img, x, y, 
		facing * image_xscale, image_yscale, 0, c_white, image_alpha);
	scFlash(flash_alpha, flash_color, facing * image_xscale, image_yscale, sprite, sprite_img, x, y);
}



