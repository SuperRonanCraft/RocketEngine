///@desc Draw the correct sprites for each animation state
///@arg state The state to use

var overwrite = false;

var state = argument[0];

switch (state) {
	
	case ANIMATIONSTATE.TECHED:
		overwrite = true;
		if(scSpecialAnimation(sPlayer_tech, 0)){
			animState = PLAYERSTATE.NORMAL;	
		}
		break;
	
	case ANIMATIONSTATE.KNOCKBACK2:
		currentSprite = sPlayer_knockBack2;
		break;
	
	case ANIMATIONSTATE.KNOCKBACK:
		currentSprite = sPlayer_knockBack;
		break;
}

//draw sprite normally
if(!overwrite){
	animationVar += image_speed;
	draw_sprite_ext(currentSprite,floor(animationVar),x,y,facing * image_xscale,image_yscale,0,c_white,image_alpha);	
}



