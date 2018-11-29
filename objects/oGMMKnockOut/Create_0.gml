/// @desc a Knockout gamemode hasstarted
event_inherited();

//Remove the ability to damage each other
var pamt = instance_number(oPlayer);
for (var i = 0; i < pamt; i++) {
	var p = instance_find(oPlayer, i);
	//Current rocket
	p.rocket_map[? ROCKET_MAP.DAMAGE] = -1;
	//All rockets
	for (var a = 0; a < array_length_1d(p.weapons); a++)
		ds_map_set(weapons[a], ROCKET_MAP.DAMAGE, -1);
}


