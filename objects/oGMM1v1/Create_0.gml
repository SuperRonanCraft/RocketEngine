/// @desc 1v1 Gamemode has started
event_inherited();

timer = scStageTimerStart(global.mode_1v1_timer); //New time
timer_current = timer;
scAllowCharacterSelect(); //Character selector allowed

scPlayerLoadPrevious(global.mode_1v1_singleplayer);

//MODIFIERS are now loaded in scPlayerLoadModifiers