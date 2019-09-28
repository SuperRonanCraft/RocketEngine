/// @desc Spawn targets config

event_inherited();
timer = scStageTimerStart(global.mode_rumble_timer); //New time
timer_current = timer;
scAllowCharacterSelect(); //Character selector allowed

//Apply Modifiers
event_user(10);