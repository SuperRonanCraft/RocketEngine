function scPlayerDrawUIBuffs(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {
	//DRAW PLAYER BUFFS
	///@arg x
	///@arg y
	///@arg buffer
	///@arg offset-every
	///@arg size
	///@arg alpha
	///@arg team-respect

	var _x = argument0;
	var _y = argument1;
	var _buffer = argument2; //offset between each buff
	var _offsetEvery = argument3;
	var _size = argument4;
	var _alpha = argument5;
	var _team_respect = argument6;
	var offset = 0; //Times we've offset
	for (var i = 0; i < ds_list_size(buffs_map); i++) {
		//Grab the buff map
		var ds_list = buffs_map[| i];
		var c = ds_list[? BUFF_MAP.GOOD] ? c_aqua : c_fuchsia;
		//Offset every 10 buffs
		if (i mod _offsetEvery == 0)
			offset++;
		//The icon set in the buff
		var sprite = ds_list[? BUFF_MAP.ICON];
		var _xoff = _x + (_size + _buffer) * (i - ((offset - 1) * _buffer));
		var xpos = _team_respect ? (team == TEAM.LEFT ? _xoff : RES_W - _xoff - _size) : _xoff;
		var ypos = _y + (_size / 2) + (offset - 1) * (_size + _buffer);
	
		//BUFF TIME
		var time = ds_list[? BUFF_MAP.TIME] - ds_list[? BUFF_MAP.CLOCK];
		var maxtime = ds_list[? BUFF_MAP.TIME];
	
		//var text = ceil(time / room_speed);
		var display_combo = false;
		var stack_info = ds_list[? BUFF_MAP.STACK_INFO];
		if (stack_info[0] == BUFF_STACK_TYPE.COMBO && stack_info[2] < stack_info[1]) {
			time = stack_info[3] - stack_info[4];
			maxtime = stack_info[3];
			c = c_black
			display_combo = true;
		}
	
		scDrawPieRect(xpos + (_size / 2), ypos + (_size / 2), time, maxtime, c, (_size / 2) + 4, 0.65 * _alpha); //BUFF TIME ROUND-OUT
		draw_sprite_ext(sprite, 0, xpos, ypos, 0.5, 0.5, 0, c_white, 1); //BUFF SPRITE
		if (display_combo)
			scDrawText(xpos, ypos, "x" + string(stack_info[2]) + "/" + string(stack_info[1]), c_white, 0.45, noone, _alpha); //BUFF COMBO
		scDrawText(xpos + _size, ypos + _size, string(ceil(time / room_speed)), c_gray, 0.45, noone, _alpha); //BUFF TIME
	}


}
