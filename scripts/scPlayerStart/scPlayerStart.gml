playerMap = ds_map_create();

var map = playerMap;

map[? PLAYER_MAP.STEP] = noone;
map[? PLAYER_MAP.CAN_CONTROL] = true;
map[? PLAYER_MAP.ALIVE] = true;
map[? PLAYER_MAP.ANIMATION_STATE] = ANIMATIONSTATE.STANDING;
map[? PLAYER_MAP.ANIMATION_VAR] = 0;
map[? PLAYER_MAP.ANIMATION_OVERRIDE] = false;
map[? PLAYER_MAP.PLAYER_STATE] = PLAYERSTATE.NORMAL;
map[? PLAYER_MAP.CURRENT_SPRITE] = sprite_index;

enum PLAYER_MAP {
	STEP, CAN_CONTROL, ALIVE, ANIMATION_VAR, ANIMATION_OVERRIDE, ANIMATION_STATE,
	PLAYER_STATE, CURRENT_SPRITE
}

enum ANIMATIONSTATE {
	STANDING, RISING, FALLING, WALKING, DEAD, KNOCKBACK, KNOCKBACK2, TECHED, TRAPPED,
	SLIDING, SLEEPING, WAKING, DEAD2, DEADLASER, DEADFROZEN
}

enum DEATH_LIST {
	LASER, FROZEN
}
