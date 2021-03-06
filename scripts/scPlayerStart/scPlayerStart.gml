player_map = ds_map_create();
weapon_map = ds_map_create();

var map = player_map;

//HEALTH
//map[? PLAYER_MAP.HEALTH] = 20;
//map[? PLAYER_MAP.HEALTH_ORIGINAL] = map[? PLAYER_MAP.HEALTH];
map[? PLAYER_MAP.DAMAGE_LAST] = 0; //Amount of damage taken last time
//MISC
map[? PLAYER_MAP.STEP] = noone;
map[? PLAYER_MAP.CAN_CONTROL] = true;
map[? PLAYER_MAP.ALIVE] = true;
map[? PLAYER_MAP.ENABLED_PICKUP] = true;
map[? PLAYER_MAP.DESTROY_SCRIPT] = noone;
map[? PLAYER_MAP.HUD_SHOW] = true; //Weapon cooldowns, ammo/clip etc..
//ANIMATION
map[? PLAYER_MAP.ANIMATION_STATE] = ANIMATIONSTATE.STANDING;
map[? PLAYER_MAP.ANIMATION_VAR] = irandom(image_number);
map[? PLAYER_MAP.ANIMATION_OVERRIDE] = false;
map[? PLAYER_MAP.PLAYER_STATE] = PLAYERSTATE.NORMAL;
map[? PLAYER_MAP.CURRENT_SPRITE] = sprite_index;
map[? PLAYER_MAP.CHARACTER_INFO] = ds_map_create(); //Info set in scPlayerCharacterChange
//FLASH PLAYER
map[? PLAYER_MAP.FLASH_ALPHA] = 0;
map[? PLAYER_MAP.FLASH_ALPHA_REDUCE] = 0.05;
map[? PLAYER_MAP.FLASH_COLOR] = c_white;

enum PLAYER_MAP {
	STEP, CAN_CONTROL, ALIVE, ANIMATION_VAR, ANIMATION_OVERRIDE, ANIMATION_STATE,
	PLAYER_STATE, CURRENT_SPRITE, CHARACTER_INFO, FLASH_ALPHA, FLASH_ALPHA_REDUCE, FLASH_COLOR, 
	DAMAGE_LAST, ENABLED_PICKUP, HUD_SHOW,
	//AI STUFF
	DESTROY_SCRIPT
}

enum ANIMATIONSTATE {
	STANDING, RISING, FALLING, WALKING, DEAD, KNOCKBACK, KNOCKBACK2, TECHED, TRAPPED,
	SLIDING, SLEEPING, WAKING, DEAD2, DEADLASER, DEADFROZEN, FROZEN,HURT,GIBS, SLICE,
	
	SLICEANIML1, SLICEANIMR1, SLICEANIMB1, SLICEANIMT1, SLICEANIMT2,
}

enum DEATH_LIST {
	LASER, FROZEN,EXPLOSION
}