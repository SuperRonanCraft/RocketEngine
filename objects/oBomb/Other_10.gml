/// @desc Explosion
var xplo = instance_create_depth(x, y, 10, oExplosion_Bomb);
var bomb_map = weapon_map[? WEAPON_MAP.MAP];
xplo.sprite_index = bomb_map[? BOMB_MAP.EXPLOSION_SPRITE];
xplo.image_speed = 1.5;
xplo.image_xscale = bomb_map[? BOMB_MAP.EXPLOSION_SCALE];
xplo.image_yscale = bomb_map[? BOMB_MAP.EXPLOSION_SCALE];
xplo.deathCause = bomb_map[? BOMB_MAP.DEATHCAUSE];
xplo.dmg = dmg;
xplo.parent = owner;
ds_map_copy(xplo.weapon_map, weapon_map);
xplo.weapon_map[? WEAPON_MAP.MAP] = ds_map_create();
ds_map_copy(xplo.weapon_map[? WEAPON_MAP.MAP], weapon_map[? WEAPON_MAP.MAP]);
//xplo.weapon_map[? WEAPON_MAP.MAP] = ds_map_create();
//ds_map_copy(xplo.weapon_map[? WEAPON_MAP.MAP], bomb_map);
ds_list_copy(xplo.confirmList, hitList);

//Particle explosion to look pretty.
bomb_map = xplo.weapon_map[? WEAPON_MAP.MAP];
var part = bomb_map[? BOMB_MAP.PARTICLE_EXPLOSION];
if (part != noone) {
	var scale = bomb_map[? BOMB_MAP.SCALE];
	part_emitter_region(global.ParticleSystem1, global.Emitter1, xplo.bbox_left,xplo.bbox_right,xplo.bbox_top,xplo.bbox_bottom, ps_shape_rectangle, ps_distr_invgaussian)
	part_emitter_burst(global.ParticleSystem1, global.Emitter1, part, (50 * scale));
}

//Shake screen
scScreenShake(bomb_map[? BOMB_MAP.SHAKE_MAGNITUDE], bomb_map[? BOMB_MAP.SHAKE_FRAMES]);

//Custom create event for bomb explosion
with (xplo)
	if (bomb_map[? BOMB_MAP.EXPLOSION_CREATE] != noone)
		script_execute(bomb_map[? BOMB_MAP.EXPLOSION_CREATE]);

//Delete this instance 
scPlaySound(SOUND.EFFECT_EXP, noone, noone, true);


instance_destroy();
