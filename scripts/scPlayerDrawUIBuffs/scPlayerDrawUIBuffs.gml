//DRAW PLAYER BUFFS
var offset = 0;
for (var i = 0; i < ds_list_size(buffs_map); i++) {
	//Grab the buff map
	var ds_list = buffs_map[| i];
	var c = ds_list[? BUFF_MAP.GOOD] ? c_aqua : c_fuchsia;
	//Offset every 10 buffs
	if (i mod 10 == 0)
		offset++;
	//The icon set in the buff
	var sprite = ds_list[? BUFF_MAP.ICON];
	//Dimentions of sprite
	var w = sprite_get_width(sprite);
	var h = sprite_get_height(sprite);
	//Determine side and offset related to how many buffs to display (2 pixels between each icon) (mirrored)
	var xpos = team == TEAM.LEFT ? (RES_W / 2) - (w) - (((w / 2) + 8) * (i - ((offset - 1) * 10)))
		: (RES_W / 2) + (w / 2) + (((w / 2) + 8) * (i - ((offset - 1) * 10)));
	var ypos = offset * (h / 2 + 2) + (RES_H / 32);
	
	//BUFF TIME
	//if (ds_list[? BUFF_MAP.TIME] != noone) {
	var time = ds_list[? BUFF_MAP.TIME] - ds_list[? BUFF_MAP.CLOCK];
	var maxtime = ds_list[? BUFF_MAP.TIME];
	//}
	
	//var text = ceil(time / room_speed);
	var display_combo = false;
	var stack_info = ds_list[? BUFF_MAP.STACK_INFO];
	if (stack_info[0] == BUFF_STACK_TYPE.COMBO && stack_info[2] < stack_info[1]) {
		time = stack_info[3] - stack_info[4];
		maxtime = stack_info[3];
		c = c_black
		display_combo = true;
	}
	
	scDrawPieRect(xpos + (w / 4), ypos + (h / 4), time, maxtime, c, (w / 4) + 4, 0.65); //BUFF TIME ROUND-OUT
	draw_sprite_ext(sprite, 0, xpos, ypos, 0.5, 0.5, 0, c_white, 1); //BUFF SPRITE
	if (display_combo)
		scDrawText(xpos, ypos, "x" + string(stack_info[2]) + "/" + string(stack_info[1]), c_white, 0.45); //BUFF COMBO
	scDrawText(xpos + w / 2, ypos + h / 2, string(ceil(time / room_speed)), c_gray, 0.45); //BUFF TIME
}