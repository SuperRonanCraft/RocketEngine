///@desc Perform a special animation with detailed parameters
///@arg sprite Sprite to use
///@arg loop 0 for no loop / 1 for loop

var sprite = argument[0];
var loop = argument[1];

//Check if loop finished
var loopFin = false;;

//Reset animationVar
if (animationVar != 0 && currentSprite != sprite)
	animationVar = 0;	

currentSprite = sprite;

if (loop == 0) {
	if (floor(animationVar) >= sprite_get_number(sprite) - 1) {
		animationVar = sprite_get_number(sprite) - 1;	
		loopFin = true;
	}
	draw_sprite_ext(currentSprite,floor(animationVar),x,y,facing*image_xscale,image_yscale,0,c_white,image_alpha);
} else
	draw_sprite_ext(currentSprite,floor(animationVar),x,y,facing*image_xscale,image_yscale,0,c_white,image_alpha);	

scFlash(flash_alpha, flash_color, facing * image_xscale, image_yscale, currentSprite, floor(animationVar), x, y); //Flash shader

animationVar += image_speed * time_dialation;

return (loopFin);