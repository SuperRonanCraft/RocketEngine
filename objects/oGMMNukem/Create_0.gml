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

//Remove the ability to take damage
for (var i = 0; i < instance_number(oPlayer); i++) {
	var p = instance_find(oPlayer, i); //Find the player
	p.damage_take = false; //Set damage take to false
}

//Inherit the default gamemode setup
event_inherited();

global.gamemode = GAMEMODE.NUKED;