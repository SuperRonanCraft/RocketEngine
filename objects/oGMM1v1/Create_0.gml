/// @desc 1v1 Gamemode has started

//Log new 1v1 game
scData_StartCount();

scStagePickupsStart(6, 60, global.mode_1v1_pickups);

event_inherited();

timer = scStageTimerStart(global.mode_1v1_timer); //New time
timer_current = timer;

//Alter hp and ults
with (oPlayer) {
	switch (global.mode_1v1_health) {
		case 0: hp = 1; break;
		case 1: hp = 5; break;
		case 2: hp = 10; break;
		case 3: hp = 20; break;
		case 4: hp = 50; break;
		case 5: hp = 100; break;
	}
	hp_original = hp;
	scStageUltimateStart(global.mode_1v1_ultimates);
	rockets_enabled = global.mode_1v1_rockets;
	//if (global.mode_1v1_lowgravity)
	//	grv /= 2;
}