///@desc Draw the correct sprites for each animation state
///@arg state The state to use

var overwrite = false;

var state = argument[0];

switch (state) {
	
	case ANIMATIONSTATE.KNOCKBACK:
		currentSprite = sPlayer_knockBack;
		break;
}

//draw sprite normally
if(!overwrite){
	animationVar += image_speed;
	draw_sprite_ext(currentSprite,floor(animationVar),x,y,facing * image_xscale,image_yscale,0,c_white,1);	
}



