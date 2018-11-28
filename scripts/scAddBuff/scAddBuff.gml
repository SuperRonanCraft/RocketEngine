/// @desc Add a buff type to a shootable
/// @arg buff-type
/// @arg target
/// @arg time of buff
/// @arg stackable buff

var buff = argument[0];
var targ = argument[1];
var time = 5;
if (argument_count > 2)
	time = argument[2];
var stackable = false;
if (argument_count > 3)
	stackable = argument[3];

//Add all buffs that were given
for (var i = 0; i < array_length_1d(buff); i++) {
	var ds_map = ds_map_create();
	ds_map[? "clock"] = 0;
	ds_map[? "time"] = time * game_get_speed(gamespeed_fps);
	ds_map[? "type"] = buff[i];
	ds_map[? "stackable"] = stackable;
	ds_map[? "disabled"] = false;
	scGetBuff(buff[i], ds_map);
	//Check if a buff from the target is the same TYPE, if not, add it, or if its stackable, just add it
	if (!scFindBuff(targ, ds_map[? "type"]) || ds_map[? "stackable"])
		ds_list_add(targ.buffs, ds_map);
}

enum BUFFTYPE {
	BURNRUSH, CHILLED, COOLDOWN, SLIME,
	
	//PUT LAST
	LENGHT
}