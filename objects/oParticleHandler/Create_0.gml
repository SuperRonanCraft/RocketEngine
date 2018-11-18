/// @description Insert description here
// You can write your code in this editor

//Particles
global.ParticleSystem1 = part_system_create();
part_system_depth(global.ParticleSystem1, -50);

global.Emitter1 = part_emitter_create(global.ParticleSystem1);

ds_part = ds_map_create();
var partWinter = part_type_create();
part_type_sprite(partWinter, s_pwinter, false, false, false);
part_type_size(partWinter, 0.1, 1, -0.05, 0);
part_type_direction(partWinter, 270, 270, 0, 0);
part_type_speed(partWinter, 0.5, 1, 0.1, 0);
ds_map_add(ds_part, PARTICLES.WINTER, partWinter);

var partIce = part_type_create();
part_type_sprite(partIce, s_pice, false, false, true);
part_type_size(partIce, 0.3, 0.5, 0, 0);
part_type_direction(partIce, 0, 360, 0, 0);
part_type_speed(partIce, 0.8, 1, 0, 0);
part_type_life(partIce, 5, 15);
ds_map_add(ds_part, PARTICLES.ICE, partIce);

var partSparkle = part_type_create();
part_type_sprite(partSparkle, s_psparkle, true, false, false);
part_type_size(partSparkle, 0.1, 0.2, 0, 0);
part_type_direction(partSparkle, 0, 360, 0, 0);
part_type_speed(partSparkle, 1, 1.3, 0.1, 0);
part_type_life(partSparkle, 15, 30);
ds_map_add(ds_part, PARTICLES.SPARKLE, partSparkle);

var partFire1 = part_type_create();
part_type_sprite(partFire1, s_pfire1, true, false, false);
part_type_size(partFire1, 1.2, 2, -0.2, 0);
part_type_direction(partFire1, 30, 120, 0, 0);
part_type_speed(partFire1, 1, 5.3, 0.2, 0);
ds_map_add(ds_part, PARTICLES.FIRE1, partFire1);

var partFire2 = part_type_create();
part_type_sprite(partFire2, s_pfire2, true, false,false);
part_type_size(partFire2, 1.2, 2, -0.2, 0);
part_type_direction(partFire2, 30, 120, 0, 0);
part_type_speed(partFire2, 1, 5.3, 0.2, 0);
ds_map_add(ds_part, PARTICLES.FIRE2, partFire2);

var partFire3 = part_type_create();
part_type_sprite(partFire3, s_pfire3, true, false, false);
part_type_size(partFire3, 1.2, 2, -0.2, 0);
part_type_direction(partFire3, 30, 120, 0, 0);
part_type_speed(partFire3, 1, 5.3, 0.2, 0);
ds_map_add(ds_part, PARTICLES.FIRE3, partFire3);

var partEmber = part_type_create();
part_type_sprite(partEmber, s_pember, false, false, true);
part_type_speed(partEmber, 0.1, 0.2, -0.02, 0);
part_type_size(partEmber, 0.4, 0.5, -0.1, 0);
part_type_life(partEmber, 5, 8);
ds_map_add(ds_part, PARTICLES.EMBER, partEmber);

var partSmoke1 = part_type_create();
part_type_sprite(partSmoke1, s_psmoke1, false, false, true);
part_type_alpha2(partSmoke1, 0.5, 1);
part_type_speed(partSmoke1, 1.5, 3, 0.5, 0);
part_type_size(partSmoke1, 0.1, 0.2, 0.01, 0.02);
part_type_direction(partSmoke1, 80, 110, 0, 0);
part_type_life(partSmoke1, 10, 15);
ds_map_add(ds_part, PARTICLES.SMOKE1, partSmoke1);

var partSand = part_type_create();
part_type_sprite(partSand, s_psand, false, false, true);
part_type_size(partSand, 0.3, 0.5, -0.05, 0);
part_type_direction(partSand, 80, 110, 0, 0);
part_type_speed(partSand, 0.8, 1, 0, 0);
part_type_life(partSand, 5, 15);
ds_map_add(ds_part, PARTICLES.SAND, partSand);

enum PARTICLES {
	WINTER, ICE, SPARKLE, FIRE1, FIRE2, FIRE3, EMBER, SMOKE1, SAND
}