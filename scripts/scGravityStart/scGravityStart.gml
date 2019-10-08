gravity_map = ds_map_create();
var map = gravity_map;

//EDITTABLE
map[? GRAVITY_MAP.WALK_SPEED] = 6;
map[? GRAVITY_MAP.JUMP_HEIGHT] = 25 - (25 / (TIME_SPEED * 2));
map[? GRAVITY_MAP.JUMP_MOD] = 0; //Amount to temporaraly add/sub from jumping
map[? GRAVITY_MAP.GRAVITY] = 1.8 / 2;

//Overall (DO NOT EDIT)
map[? GRAVITY_MAP.HSP] = 0;
map[? GRAVITY_MAP.VSP] = 0; 
map[? GRAVITY_MAP.STANDING] = true; 
//Player Controlled
map[? GRAVITY_MAP.HSP_MOVE] = 0;
map[? GRAVITY_MAP.VSP_MOVE] = 0;
map[? GRAVITY_MAP.HSP_MOVE_MOD] = 0; //Movement added (not reset)
//Buffs n stuff (reset per step)
map[? GRAVITY_MAP.HSP_PUSH] = 0;
map[? GRAVITY_MAP.VSP_PUSH] = 0;
map[? GRAVITY_MAP.HSP_KNOCKBACK] = 0;
map[? GRAVITY_MAP.VSP_KNOCKBACK] = 0;
map[? GRAVITY_MAP.KNOCKBACK_MULTI] = 1;
map[? GRAVITY_MAP.KNOCKBACK_ENABLED] = true; //Should kb be enabled?
map[? GRAVITY_MAP.TECHED_ENABLED] = true; //Should teching be allowed?

//Specials
player_tech = true; //Remove the bounce and teching
//player_knockback = true; //Remove knockback all together

grv_dir = 1;

enum GRAVITY_MAP {
	WALK_SPEED, JUMP_HEIGHT, GRAVITY, JUMP_MOD,
	HSP, VSP, STANDING,
	HSP_MOVE, VSP_MOVE, //Player Controlled
	HSP_MOVE_MOD, HSP_PUSH, VSP_PUSH, //Buffs
	HSP_KNOCKBACK, VSP_KNOCKBACK, KNOCKBACK_MULTI, KNOCKBACK_ENABLED, //Knockback
	TECHED_ENABLED
}