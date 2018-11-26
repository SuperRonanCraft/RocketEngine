///@desc Draw the correct sprites for each animation state
///@arg state The state to use

var state = argument[0];

switch (state) {
	
	case ANIMATIONSTATE.WALKING:
		currentSprite = sPlayer_walk;	
		break;	
	
	case ANIMATIONSTATE.RISING:
		currentSprite = sPlayer_rise;	
		break;	
	
	case ANIMATIONSTATE.FALLING:
        currentSprite = sPlayer_fall;	
		break;
	
    case ANIMATIONSTATE.STANDING:
	default:
        currentSprite = sPlayer_idle;
        break;
}

//draw sprite
draw_sprite_ext(currentSprite,floor(animationVar),x,y,facing,1,0,c_white,1);	