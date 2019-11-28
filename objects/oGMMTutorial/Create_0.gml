/// @desc Tutorial
event_inherited();

var player = oPlayer;

with (player) {
	//scPlayerCharacterChange(CHARACTERS.DEFAULT); INF LOOP
	shootable_map[? SHOOTABLE_MAP.HEALTH_BASE] = 20;
	shootable_map[? SHOOTABLE_MAP.HEALTH_BASE_ORIGINAL] = 20;
	player_aimode = true;
	aiBrain = other;
	scWeaponModify(id, WEAPON_MODIFIER.DEFAULT);
}

tutorial_start = false;
tutorial_part = 0;
//Action
player_action = noone;
player_action_time = 0; //Time in action