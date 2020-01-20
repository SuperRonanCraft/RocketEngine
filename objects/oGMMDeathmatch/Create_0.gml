/// @desc Spawn targets config

//scAllowCharacterSelect(); //Character selector allowed
scSpawnPlayer(100, 100, KEYBIND_PLAYER.PLAYER1, true, CHARACTER.DEFAULT);
scSpawnPlayer(100, 100, KEYBIND_PLAYER.PLAYER2, true, CHARACTER.DEFAULT);
scSpawnPlayer(100, 100, KEYBIND_PLAYER.PLAYER3, false, CHARACTER.DEFAULT);
scSpawnPlayer(100, 100, KEYBIND_PLAYER.PLAYER4, false, CHARACTER.DEFAULT, noone, true);
scControllersFix();
scAllowCharacterSelect(); //Character selector allowed

event_inherited();
timer = scStageTimerStart(global.mode_rumble_timer); //New time
timer_current = timer;

//MODIFIERS are now loaded in scPlayerLoadModifiers