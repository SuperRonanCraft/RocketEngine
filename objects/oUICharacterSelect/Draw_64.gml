/// @desc gamemode stage selection draw gui event

//Character title
if (instance_find(object_index, 0) == id)
	scDrawText(xx, yy, "Choose Character", color_element, 1.5);

//UI Draw event
event_inherited();

if (selected)
	scDrawText(start_x_default, start_y_default + RES_H / 4, "Waiting on others...", color_element_special, 0.7, noone, 0.8);
else if (char_last != noone) {
	var char_draw = char_last - 1;
	if (char_last - 1 < 0)
		char_draw = noone;
	if (char_draw != noone) {
		//Character behind of current
		var char_map = scPlayerCharacterGetSprites(char_draw);
		var sprite = char_map[? ANIMATIONSTATE.STANDING];
		draw_sprite_ext(sprite, 0, start_x_default - (char_x_offset + char_x), start_y_default + RES_H / 6, 
			char_scale_b, char_scale_b, 0, c_white, 0.6);
	}

	//Character front of current
	char_draw = char_last + 1;
	if (char_draw >= CHARACTERS.LENGTH)
		char_draw = noone;
	if (char_draw != noone) {
		var char_map = scPlayerCharacterGetSprites(char_draw);
		var sprite = char_map[? ANIMATIONSTATE.STANDING];
		draw_sprite_ext(sprite, 0, start_x_default + (char_x_offset - char_x), start_y_default + RES_H / 6, 
			char_scale_a, char_scale_a, 0, c_white, 0.6);
	}
	
	//Destroy the draw char map
	ds_map_destroy(char_map);
}

var char_cur = char_last;

with (player) {
	image_alpha = 0;
	var sprite = player_map[? PLAYER_MAP.CURRENT_SPRITE];
	var sprite_img = floor(player_map[? PLAYER_MAP.ANIMATION_VAR]);
	draw_sprite_ext(sprite, sprite_img, other.start_x_default - other.char_x_cur, other.start_y_default + RES_H / 6, 
		other.char_scale_cur, other.char_scale_cur, 0, c_white, !other.selected ? 1 : 0.2);
	if (!other.selected) {
		var char = player_map[? PLAYER_MAP.CHARACTER_INFO];
		scDrawText(other.start_x_default, other.start_y_default + RES_H / 4, char[? CHARACTER_MAP.NAME], c_yellow, 0.5);
		other.char_last = char[? CHARACTER_MAP.TYPE];
	}
}

char_x = lerp(char_x, 0, 0.1);
char_x_cur = lerp(char_x_cur, 0, 0.1);
char_scale_a = lerp(char_scale_a, char_scale_min, 0.1);
char_scale_b = lerp(char_scale_b, char_scale_min, 0.1);
char_scale_cur = lerp(char_scale_cur, char_scale_cur_max, 0.1);

if (char_cur != char_last) {
	var scale_cur = char_scale_cur;
	char_scale_cur = char_cur > char_last ? char_scale_b : char_scale_a;
	char_x = char_x_offset * (char_cur - char_last);
	if (char_cur > char_last) { //GOING BACK
		char_scale_a = scale_cur;
		char_scale_b = 0.2;
	} else {
		char_scale_a = 0.2;
		char_scale_b = scale_cur;
	}
	char_x_cur = char_x_offset * (char_cur - char_last);
}