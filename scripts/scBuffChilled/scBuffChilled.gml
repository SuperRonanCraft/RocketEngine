///@desc The "Chilled" Buff
///@arg owner Owner of buff
///@arg buff Parent Buff DS Map

var owner = argument0;
var dsBuff = argument1;

//define the internal clock
var clock = dsBuff[? BUFF_MAP.CLOCK];

//When the buff firt starts, apply the slow
if (clock == 0) {	
	//Create a new item in the DS Map so that it isn't saved to the object
	dsBuff[? "slow"] = owner.gravity_map[? GRAVITY_MAP.WALK_SPEED] / 2;
	//This way it does not get changed/affected in any other way
}
//If the internal clock reaches the time in seconds, expire
if (scBuffFind(owner, BUFFTYPE.BURNRUSH) || clock > dsBuff[? BUFF_MAP.TIME]) {
	//Return to normal speed
	//owner.gravity_map[? GRAVITY_MAP.HSP_MOVE_MOD] += dsBuff[? "slow"];	
	//Remove Chilled
	scBuffRemove(owner, dsBuff);
} else {
	//Otherwise, the buff is still active, and create a visual indicator
	owner.gravity_map[? GRAVITY_MAP.HSP_MOVE_MOD] -= dsBuff[? "slow"];
	if (clock % 2 == 0) {
		var part = dsBuff[? BUFF_MAP.PARTICLE];
		var amt = dsBuff[? BUFF_MAP.PARTICLE_AMT];
		var xoffset = (owner.x - owner.bbox_right) / 2;
		var yoffset = owner.bbox_bottom - owner.y;
		//One particle for each foot!
		part_particles_create(global.ParticleSystem1, owner.x - xoffset,
			owner.y + yoffset, part, amt);
		part_particles_create(global.ParticleSystem1, owner.x + xoffset,
			owner.y + yoffset, part, amt);
	}
	//Also, increaase the clock. Essential for every buff.
	dsBuff[? BUFF_MAP.CLOCK]++;
}