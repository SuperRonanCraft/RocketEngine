/// @desc gamemode stage selection draw gui event

//Character title
if (instance_find(object_index, 0) == id)
	scDrawText(xx, yy, "Choose Character", color_element, 1.5);

//UI Draw event
event_inherited();

if (selected)
	scDrawText(start_x_default, start_y_default + RES_H / 4, "Waiting on others...", color_element_special, 0.7, noone, 0.8);
else {
	var char_draw = char_last - 1;
	if (char_last - 1 < 0)
		char_draw = noone;
	if (char_draw != noone) {
		//Character behind of current
		var char_map = scPlayerCharacterGetSprites(char_draw);
		var sprite = char_map[? ANIMATIONSTATE.STANDING];
		draw_sprite_ext(sprite, 0, start_x_default - char_x, start_y_default + RES_H / 6, 
			char_scale, char_scale, 0, c_white, 0.6);
	}

	//Character front of current
	char_draw = char_last + 1;
	if (char_draw >= CHARACTERS.LENGTH)
		char_draw = noone;
	if (char_draw != noone) {
		var char_map = scPlayerCharacterGetSprites(char_draw);
		var sprite = char_map[? ANIMATIONSTATE.STANDING];
		draw_sprite_ext(sprite, 0, start_x_default + char_x, start_y_default + RES_H / 6, 
			char_scale, char_scale, 0, c_white, 0.6);
	}
	
	//Destroy the draw char map
	ds_map_destroy(char_map);
}
char_x = lerp(char_x, char_x_offset, 0.1);
char_scale = lerp(char_scale, char_scale_min, 0.1);

var char_cur = char_last;

with (player) {
	image_alpha = 0;
	var sprite = player_map[? PLAYER_MAP.CURRENT_SPRITE];
	var sprite_img = floor(player_map[? PLAYER_MAP.ANIMATION_VAR]);
	draw_sprite_ext(sprite, sprite_img, other.start_x_default, other.start_y_default + RES_H / 6, 
		facing * 2, 2, 0, c_white, !other.selected ? 1 : 0.2);
	if (!other.selected) {
		var char = player_map[? PLAYER_MAP.CHARACTER_INFO];
		scDrawText(other.start_x_default, other.start_y_default + RES_H / 4, char[? CHARACTER_MAP.NAME], c_yellow, 0.5);
		other.char_last = char[? CHARACTER_MAP.TYPE];
	}
}

if (char_cur != char_last) {
	char_x = 0;
	char_scale = 2;
}