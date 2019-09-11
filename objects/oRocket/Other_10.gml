/// @desc Explosion
var xplo = instance_create_depth(x, y, 10, oExplosion);
var rocket_map = weapon_map[? WEAPON_MAP.MAP];
xplo.sprite_index = rocket_map[? ROCKET_MAP.EXPLOSION_SPRITE];
xplo.image_speed = 1.5;
xplo.image_xscale = rocket_map[? ROCKET_MAP.EXPLOSION_SCALE];
xplo.image_yscale = rocket_map[? ROCKET_MAP.EXPLOSION_SCALE];
xplo.parent = owner;
ds_map_copy(xplo.weapon_map, weapon_map);
//xplo.weapon_map[? WEAPON_MAP.MAP] = ds_map_create();
//ds_map_copy(xplo.weapon_map[? WEAPON_MAP.MAP], rocket_map);
ds_list_copy(xplo.confirmList, hitList);

//Particle explosion to look pretty.
var part = rocket_map[? ROCKET_MAP.PARTICLE_EXPLOSION];
if (part != noone) {
	var scale = rocket_map[? ROCKET_MAP.SCALE];
	part_emitter_region(global.ParticleSystem1, global.Emitter1, x - (30 * scale), x + (30 * scale), 
		y - (30 * scale), y + (30 * scale), ps_shape_ellipse, ps_distr_gaussian)
	part_emitter_burst(global.ParticleSystem1, global.Emitter1, part, (50 * scale));
}

//Shake screen
scScreenShake(rocket_map[? ROCKET_MAP.SHAKE_MAGNITUDE], rocket_map[? ROCKET_MAP.SHAKE_FRAMES]);

//Custom create event for rocket explosion
with (xplo)
	if (rocket_map[? ROCKET_MAP.EXPLOSION_CREATE] != noone)
		script_execute(rocket_map[? ROCKET_MAP.EXPLOSION_CREATE]);

//Delete this instance of oRocket
destroy = true;
scPlaySound(SOUND.EFFECT_EXP);