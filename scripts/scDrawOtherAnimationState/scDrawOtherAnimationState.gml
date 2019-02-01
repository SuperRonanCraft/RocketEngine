///@desc Draw the correct sprites for each animation state
///@arg state The state to use

var overwrite = false;

var state = argument[0];

switch (state) {
	case ANIMATIONSTATE.TRAPPED:
		currentSprite = sPlayer_trapped;
		break;
	case ANIMATIONSTATE.TECHED:
		overwrite = true;
		if (scSpecialAnimation(sPlayer_tech, 0))
			animState = PLAYERSTATE.NORMAL;
		break;
	case ANIMATIONSTATE.KNOCKBACK2:
		currentSprite = sPlayer_knockBack2;
		break;
	case ANIMATIONSTATE.KNOCKBACK:
		currentSprite = sPlayer_knockBack;
		break;
}

//draw sprite normally
if (!overwrite) {
	animationVar += image_speed;
	var sprite = currentSprite;
	var sprite_img = floor(animationVar);
	draw_sprite_ext(sprite, sprite_img, x, y, 
		facing * image_xscale, image_yscale, 0, c_white, image_alpha);
	scFlash(flash_alpha, flash_color, facing * image_xscale, image_yscale, sprite, sprite_img, x, y);
}



