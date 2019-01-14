/// @desc a Knockout gamemode hasstarted
//Set players hp to the gamemodes default health start

with (oPlayer) {
	hp = 1;
	hp_original = hp;
}

//Remove the ability to take damage
for (var i = 0; i < instance_number(oPlayer); i++) {
	var p = instance_find(oPlayer, i); //Find the player
	p.damage_take = false; //Set damage take to false
}

event_inherited();