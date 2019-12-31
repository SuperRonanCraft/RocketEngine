///@desc Perform a special animation with detailed parameters
///@arg sprite Sprite to use
///@arg loop 0 for no loop / 1 for loop / 2 for backwards-loop
///@arg random_static*

var sprite = argument[0];
var loop = argument[1];

var random_static = false;
if(argument_count > 2){
	random_static = argument[2];
}

var map = player_map;

//Check if loop finished
var loopFin = false;

//Reset animationVar
var animationVar = map[? PLAYER_MAP.ANIMATION_VAR];
if (animationVar != 0 && map[? PLAYER_MAP.CURRENT_SPRITE] != sprite) {
	animationVar = (loop == 2) ? sprite_get_number(sprite) - 1 : 0;
	map[? PLAYER_MAP.ANIMATION_VAR] = animationVar;
}

map[? PLAYER_MAP.CURRENT_SPRITE] = sprite;

//Do not loop
if (loop == 0) {
	
	if(random_static){
		animationVar = irandom_range(0,sprite_get_number(sprite)-1);
		map[? PLAYER_MAP.ANIMATION_VAR] = animationVar;
	}
	else{
		if (floor(animationVar) >= sprite_get_number(sprite) - 1) {
			animationVar = sprite_get_number(sprite) - 1;
			map[? PLAYER_MAP.ANIMATION_VAR] = animationVar;
			loopFin = true;
		}
	}
	
	
} 
//Loop backwards
else if (loop == 2) {
	if (floor(animationVar) <= 0) {
		animationVar = 0;
		map[? PLAYER_MAP.ANIMATION_VAR] = animationVar;
		loopFin = true;
	}
}



var currentSprite = map[? PLAYER_MAP.CURRENT_SPRITE];
draw_sprite_ext(currentSprite, floor(animationVar), x, y, facing * image_xscale, image_yscale, 0, c_white, image_alpha);

scFlash(map[? PLAYER_MAP.FLASH_ALPHA], map[? PLAYER_MAP.FLASH_COLOR],
	facing * image_xscale, image_yscale, currentSprite, floor(animationVar), x, y); //Flash shader

map[? PLAYER_MAP.ANIMATION_VAR] += (image_speed * time_dialation) * (loop == 2 ? -1 : 1);

return (loopFin);