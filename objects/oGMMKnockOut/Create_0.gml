/// @desc a Knockout gamemode hasstarted
//Set players hp to the gamemodes default health start

with (oPlayer) {
	switch (global.mode_kb_health) {
		case 0: hp = 1; break;
		case 1: hp = 2; break;
		case 2: hp = 3; break;
		case 3: hp = 5; break;
		case 4: hp = 10; break;
	}
	hp_original = hp;
	switch (global.mode_kb_ultimates) {
		case 0: ult_enabled = false; break;
		case 1: break;
		case 2: ult_charge_multiplier *= 10;
	}
	player_tech = false; //Disable wall bounce
}

//Remove the ability to take damage
for (var i = 0; i < instance_number(oPlayer); i++) {
	var p = instance_find(oPlayer, i); //Find the player
	p.damage_take = false; //Set damage take to false
}

event_inherited();