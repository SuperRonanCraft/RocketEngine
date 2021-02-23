///@desc The "Speed" Buff
///@arg owner Owner of buff
///@arg buff Parent Buff DS Map
function scBuffSpeed(argument0, argument1) {

	var owner = argument0;
	var dsBuff = argument1;

	var clock = dsBuff[? BUFF_MAP.CLOCK];

	if (clock = 0)
		dsBuff[? "overallSpeed"] = 0;

	//If the internal clock reaches the time in seconds, expire
	if (clock > dsBuff[? BUFF_MAP.TIME]) {
		//Return to normal speed
		owner.gravity_map[? GRAVITY_MAP.WALK_SPEED_MOD] -= dsBuff[? "overallSpeed"];
		scBuffRemove(owner, dsBuff);
	} else {
		//Create a new item in the DS Map so that it isn't saved to the object
		if (owner.shootable_map[? SHOOTABLE_MAP.HEALTH_BASE] > 0) {
			dsBuff[? "speedup"] = owner.gravity_map[? GRAVITY_MAP.WALK_SPEED] * .5;
			owner.gravity_map[? GRAVITY_MAP.WALK_SPEED_MOD] -= dsBuff[? "overallSpeed"];
			owner.gravity_map[? GRAVITY_MAP.WALK_SPEED_MOD] += dsBuff[? "speedup"];
			dsBuff[? "overallSpeed"] = dsBuff[? "speedup"];
		} else
			dsBuff[? BUFF_MAP.CLOCK] = dsBuff[? BUFF_MAP.TIME];
		//Otherwise, the buff is still active, and create a visual indicator
		scParticleCreate(x + irandom_range(-10, 10), y + irandom_range(-15, 15), 
			dsBuff[? BUFF_MAP.PARTICLE], abs((dsBuff[? BUFF_MAP.TIME] - clock) / (dsBuff[? BUFF_MAP.TIME] / 2)) * dsBuff[? BUFF_MAP.PARTICLE_AMT]);
		dsBuff[? BUFF_MAP.CLOCK]++;
	}


}
