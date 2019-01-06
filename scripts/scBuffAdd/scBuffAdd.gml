/// @desc Add a buff type to a shootable
/// @arg buff-type
/// @arg target
/// @arg time* of buff
/// @arg stackable* buff

var buff = argument[0];
var targ = argument[1];
var time = 5;
if (argument_count > 2)
	time = argument[2];
var stackable = false;
if (argument_count > 3)
	stackable = argument[3];

//Add all buffs that were given
if (is_array(buff))
	for (var i = 0; i < array_length_1d(buff); i++) {
		var ds_map = ds_map_create();
		ds_map[? BUFF_MAP.CLOCK] = 0;
		ds_map[? BUFF_MAP.TIME] = time * game_get_speed(gamespeed_fps);
		ds_map[? BUFF_MAP.STACKABLE] = stackable;
		ds_map[? BUFF_MAP.DISABLED] = false;
		scBuffGet(buff[i], ds_map);
		//Check if a buff from the target is the same TYPE, if not, add it, or if its stackable, just add it
		if (!scBuffFind(targ, ds_map[? BUFF_MAP.TYPE]) || ds_map[? BUFF_MAP.STACKABLE])
			ds_list_add(targ.buffs, ds_map);
	}
else {
	var ds_map = ds_map_create();
	ds_map[? BUFF_MAP.CLOCK] = 0;
	ds_map[? BUFF_MAP.TIME] = time * game_get_speed(gamespeed_fps);
	ds_map[? BUFF_MAP.STACKABLE] = stackable;
	ds_map[? BUFF_MAP.DISABLED] = false;
	scBuffGet(buff, ds_map);
	//Check if a buff from the target is the same TYPE, if not, add it, or if its stackable, just add it
	if (!scBuffFind(targ, ds_map[? BUFF_MAP.TYPE]) || ds_map[? BUFF_MAP.STACKABLE])
		ds_list_add(targ.buffs, ds_map);
}