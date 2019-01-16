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

var ds_map = ds_map_create();
ds_map[? BUFF_MAP.CLOCK] = 0;
ds_map[? BUFF_MAP.TIME] = time * game_get_speed(gamespeed_fps);
ds_map[? BUFF_MAP.STACKABLE] = false;
ds_map[? BUFF_MAP.DISABLED] = false;
scBuffGet(buff, ds_map);
//Check if a buff from the target is the same TYPE, if not, add it, or if its stackable, just add it
if (!scBuffFind(targ, ds_map[? BUFF_MAP.TYPE]) || ds_map[? BUFF_MAP.STACKABLE])
	ds_list_add(targ.buffs, ds_map);
else
	for (var i = 0; i < ds_list_size(targ.buffs); i++) {
		var currentBuff = targ.buffs[| i];
		//If the types are equal
		if (currentBuff[? BUFF_MAP.TYPE] == ds_map[? BUFF_MAP.TYPE])
			currentBuff[? BUFF_MAP.CLOCK] = 1;
	}