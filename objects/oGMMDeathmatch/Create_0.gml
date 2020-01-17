/// @desc Spawn targets config

event_inherited();
timer = scStageTimerStart(global.mode_rumble_timer); //New time
timer_current = timer;
scAllowCharacterSelect(); //Character selector allowed

//MODIFIERS are now loaded in scPlayerLoadModifiers