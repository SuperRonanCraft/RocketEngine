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
	case r1v1Select: gamemode = 0; break;
	case rvTargetSelect: gamemode = 1; break;
	case rKnockOutSelect: gamemode = 2; break;
	case rNukemSelect: gamemode = 3; break;
}