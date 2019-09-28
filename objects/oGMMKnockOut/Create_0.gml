/// @desc a Knockout gamemode hasstarted
//Set players hp to the gamemodes default health start

//scStagePickupsStart(6, 60, global.mode_kb_pickups);

event_inherited();

timer = scStageTimerStart(global.mode_kb_timer); //New time
timer_current = timer;
scAllowCharacterSelect(); //Character selector allowed

//Remove the ability to take damage
for (var i = 0; i < instance_number(oPlayer); i++) {
	var p = instance_find(oPlayer, i); //Find the player
	p.shootable_map[? SHOOTABLE_MAP.CAN_DAMAGE] = false; //Set damage take to false
}

//MODIFIERS are now loaded in scPlayerLoadModifiers