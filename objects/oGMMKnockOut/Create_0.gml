/// @desc a Knockout gamemode hasstarted
//Set players hp to the gamemodes default health start

//scStagePickupsStart(6, 60, global.mode_kb_pickups);

event_inherited();

timer = scStageTimerStart(global.mode_kb_timer); //New time
timer_current = timer;

//Remove the ability to take damage
for (var i = 0; i < instance_number(oPlayer); i++) {
	var p = instance_find(oPlayer, i); //Find the player
	p.damage_take = false; //Set damage take to false
}

//Alter hp and ults
with (oPlayer) {
	switch (global.mode_kb_health) {
		case 0: hp = 1; break;
		case 1: hp = 2; break;
		case 2: hp = 3; break;
		case 3: hp = 5; break;
		case 4: hp = 10; break;
	}
	hp_original = hp;
	scStageUltimateStart(global.mode_kb_ultimates);
	player_tech = false; //Disable wall bounce
}