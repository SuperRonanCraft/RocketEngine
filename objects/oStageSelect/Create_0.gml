/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
stages = 0;
stage_on = 0;
stage_on_current = stage_on;
//Mouse movement
mouse_moving = false;
mouse_y_gui = 0;

switch (room) {
	case r1v1Select: global.gamemode = global.gamemodes[GAMEMODE.ONEVONE]; break;
	case rvTargetSelect: global.gamemode = global.gamemodes[GAMEMODE.TARGETS]; break;
	case rKnockOutSelect: global.gamemode = global.gamemodes[GAMEMODE.KNOCKOUT]; break;
	case rNukemSelect: global.gamemode = global.gamemodes[GAMEMODE.NUKED]; break;
}