var side = argument[0] == 0 ? 1 : -1;

var keys = [ROCKET_MAP.HIT_PICKUP, ROCKET_MAP.ROCKET_STEP, ROCKET_MAP.ROCKET_CREATE,
	ROCKET_MAP.ROCKET_DESTROY, ROCKET_MAP.PARTICLE_TRAIL, ROCKET_MAP.PARTICLE_AMT, ROCKET_MAP.PARTICLE_CHANGE_ORIENTATION];
var values = [scUltimateHackLoot_ExpLoot, noone, noone, noone, 
	oParticleHandler.ds_part[? PARTICLES.HACK], 1, false];
var rocket_map = weapon_map;
var amt = instance_number(pPickup);
for (var i = 0; i < amt; i++) {
	var inst = instance_find(pPickup, i);
	if (inst.team == team || inst.item == noone)
		continue;
	var dir = point_direction(x, y, inst.x, inst.y);
	scSpawnRocket(x, y, depth + 1, dir, id, rocket_map, keys, values);
}