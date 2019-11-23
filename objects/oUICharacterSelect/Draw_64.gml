/// @desc gamemode stage selection draw gui event


if (char_animate) {
	//Current Character
	if (char_animate_step == false) {
		char_y = start_y_default + RES_H / 6;
		char_x = start_x_default - char_x;
		char_animate_step = true;
		alpha = 1;
	}
	var char_draw = char_last;
	if (char_draw != noone) {
		var char_anim_map = scPlayerCharacterGetSprites(char_draw);
		var sprite = char_anim_map[? ANIMATIONSTATE.STANDING];
		var char_map = scPlayerCharacterGetInfo(char_draw);
		scPalleteSwapSet(char_map[? CHARACTER_MAP.PALETTE], char_palette);
		draw_sprite_ext(sprite, floor(char_img), char_x, char_y, 
			char_scale_cur * char_dir, char_scale_cur, 0, c_white, alpha);
		scPalleteSwapReset();
		ds_map_destroy(char_map);
		//Destroy the draw char map
		ds_map_destroy(char_anim_map);
	}

	if (instance_exists(player)) {
		with (player) {
			var sprite = characterSprites[? ANIMATIONSTATE.STANDING];
			other.char_img += image_speed * time_dialation;
			if (other.char_img >= sprite_get_number(sprite))
				other.char_img = 0;
		}

		char_x = lerp(char_x, player.x, 0.1);
		char_y = lerp(char_y, player.y, 0.1);
		alpha -= 0.04;
		//char_x_cur = lerp(char_x_cur, 0, 0.1);
		char_scale_cur = lerp(char_scale_cur, player.image_xscale, 0.1);
		if (alpha <= 0 || global.play || ((char_x - player.x < 5) && (char_y - player.y < 5)))
			instance_destroy();
	}
	exit;
}
//Character title
if (instance_find(object_index, 0) == id)
	scDrawText(xx, yy, "Choose Character", color_element, 1.5);

//UI Draw event
event_inherited();

var char_cur = char_last;

if (selected)
	scDrawText(start_x_default, start_y_default, "Waiting on others...", c_white, 0.7, noone, 0.9);
else if (char_last != noone) {
	
	//Character behind of current
	var char_draw = char_last - 1;
	if (char_draw < 0)
		char_draw = noone;
	if (char_draw != noone) {
		var char_anim_map = scPlayerCharacterGetSprites(char_draw);
		var sprite = char_anim_map[? ANIMATIONSTATE.STANDING];
		draw_sprite_ext(sprite, 0, start_x_default - (char_x_offset + char_x), start_y_default + RES_H / 6, 
			char_scale_b * char_dir, char_scale_b, 0, c_white, 0.6);
		//Destroy the draw char map
		ds_map_destroy(char_anim_map);
	}

	//Character front of current
	char_draw = char_last + 1;
	if (char_draw >= CHARACTER.LENGTH)
		char_draw = noone;
	if (char_draw != noone) {
		var char_anim_map = scPlayerCharacterGetSprites(char_draw);
		var sprite = char_anim_map[? ANIMATIONSTATE.STANDING];
		var char_map = scPlayerCharacterGetInfo(char_draw);
		draw_sprite_ext(sprite, 0, start_x_default + (char_x_offset - char_x), start_y_default + RES_H / 6, 
			char_scale_a * char_dir, char_scale_a, 0, c_white, 0.6);
		//Destroy the draw char map
		ds_map_destroy(char_anim_map);
	}
}

//Current Character
var char_draw = char_last;
if (char_draw != noone) {
	var char_anim_map = scPlayerCharacterGetSprites(char_draw);
	var sprite = char_anim_map[? ANIMATIONSTATE.STANDING];
	var char_map = scPlayerCharacterGetInfo(char_draw);
	scPalleteSwapSet(char_map[? CHARACTER_MAP.PALETTE], char_palette);
	draw_sprite_ext(sprite, floor(char_img), start_x_default - char_x, start_y_default + RES_H / 6, 
		char_scale_cur * char_dir, char_scale_cur, 0, c_white, 1);
	scPalleteSwapReset();
	ds_map_destroy(char_map);
	//Destroy the draw char map
	ds_map_destroy(char_anim_map);
}

if (instance_exists(player))
	with (player) {
		image_alpha = 0;
		var sprite = characterSprites[? ANIMATIONSTATE.STANDING];
		other.char_img += image_speed * time_dialation;
		if (other.char_img >= sprite_get_number(sprite))
			other.char_img = 0;
		if (!other.selected) {
			var char = player_map[? PLAYER_MAP.CHARACTER_INFO];
			scDrawText(other.start_x_default, other.start_y_default + RES_H / 4, char[? CHARACTER_MAP.NAME], c_yellow, 0.5);
			if (char[? CHARACTER_MAP.TYPE] != undefined) {
				other.char_last = char[? CHARACTER_MAP.TYPE];
				other.char_palette = char[? CHARACTER_MAP.PALETTE_INDEX];
			}
		}
	}

char_x = lerp(char_x, 0, 0.1);
//char_x_cur = lerp(char_x_cur, 0, 0.1);
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
	//char_x_cur = char_x_offset * (char_cur - char_last);
}