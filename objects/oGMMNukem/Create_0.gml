/// @desc Nukem gamemode started
//Set players hp to the gamemodes default health start
for (var i = 0; i < instance_number(oPlayer); i++) {
	var ins = instance_find(oPlayer, i);
	with (ins) {
		hp = other.hp_start;
		hp_original = hp;
	}
}
nukes_max = 2;
nukes = 0;
nukes_created = 0;
spawn_time = 60;

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

//Inherit the default gamemode setup
event_inherited();