gravity_map = ds_map_create();
var map = gravity_map;

//EDITTABLE
map[? GRAVITY_MAP.GRAVITY_ENABLED] = true; //Should we even fall?
map[? GRAVITY_MAP.WALK_SPEED] = 6;
map[? GRAVITY_MAP.WALK_SPEED_MOD] = 0;
map[? GRAVITY_MAP.JUMP_HEIGHT] = 25 - (25 / (TIME_SPEED * 2));
map[? GRAVITY_MAP.JUMP_MOD] = 0; //Amount to temporaraly add/sub from jumping
map[? GRAVITY_MAP.GRAVITY] = 1.8/2;

//Overall (DO NOT EDIT)
map[? GRAVITY_MAP.HSP] = 0;
map[? GRAVITY_MAP.VSP] = 0;
map[? GRAVITY_MAP.HSP_LAST] = 0;
map[? GRAVITY_MAP.VSP_LAST] = 0; 
map[? GRAVITY_MAP.STANDING] = true; 
//Player Controlled
map[? GRAVITY_MAP.HSP_MOVE] = 0;
map[? GRAVITY_MAP.VSP_MOVE] = 0;
map[? GRAVITY_MAP.HSP_MOVE_MOD] = 0; //Movement added (not reset)
//Weapon Controlled
map[? GRAVITY_MAP.FRICTION] = 0.9;
map[? GRAVITY_MAP.FRICTION_MULTI] = 0;
//Buffs n stuff (reset per step)
map[? GRAVITY_MAP.HSP_PUSH] = 0;
map[? GRAVITY_MAP.VSP_PUSH] = 0;
map[? GRAVITY_MAP.HSP_KNOCKBACK] = 0;
map[? GRAVITY_MAP.VSP_KNOCKBACK] = 0;
map[? GRAVITY_MAP.KNOCKBACK_MULTI] = 1;
map[? GRAVITY_MAP.KNOCKBACK_ENABLED] = true; //Should kb be enabled?
map[? GRAVITY_MAP.TECHED_ENABLED] = true; //Should teching be allowed?
map[? GRAVITY_MAP.JUMP_LAG] = 0; //Current lag
map[? GRAVITY_MAP.JUMP_LAG_MAX] = 7; //Maximum lag to allow a jump
map[? GRAVITY_MAP.JUMP_JUMPS] = 0; //Current amt of jumps
map[? GRAVITY_MAP.JUMP_JUMPS_MAX] = 2; //Maximum amount of jumps allowed
map[? GRAVITY_MAP.JUMP_DELAY] = 0; //Current delay since last jump
map[? GRAVITY_MAP.JUMP_DELAY_MAX] = 7; //Minumum amount of time between jumps

friction_base = 0.15;
friction_adj = 0;
recoilKB = 0;
recoilMAX = 0;

//Specials
player_tech = true; //Remove the bounce and teching
//player_knockback = true; //Remove knockback all together

grv_dir = 1;

enum GRAVITY_MAP {
	WALK_SPEED, WALK_SPEED_MOD, JUMP_HEIGHT, GRAVITY, JUMP_MOD,
	HSP, VSP, HSP_LAST, VSP_LAST, STANDING,
	HSP_MOVE, VSP_MOVE, //Player Controlled
	FRICTION_MULTI, FRICTION, //WEAPON Controlled
	HSP_MOVE_MOD, HSP_PUSH, VSP_PUSH, //Buffs
	HSP_KNOCKBACK, VSP_KNOCKBACK, KNOCKBACK_MULTI, KNOCKBACK_ENABLED, //Knockback
	TECHED_ENABLED, GRAVITY_ENABLED,
	JUMP_LAG, JUMP_LAG_MAX, JUMP_JUMPS, JUMP_JUMPS_MAX, JUMP_DELAY, JUMP_DELAY_MAX
}