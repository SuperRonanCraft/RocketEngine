/// @description Insert description here
// You can write your code in this editor

//Particles
global.ParticleSystem1 = part_system_create();
part_system_depth(global.ParticleSystem1, 100);

global.Emitter1 = part_emitter_create(global.ParticleSystem1);

ds_part = ds_map_create();
var parttype = part_type_create();
part_type_sprite(parttype, s_pwinter, false, false, false);
part_type_size(parttype, 0.1, 1, -0.05, 0);
part_type_direction(parttype, 270, 270, 0, 0);
part_type_speed(parttype, 0.5, 1, 0.1, 0);
ds_map_add(ds_part, PARTICLES.WINTER, parttype);

parttype = part_type_create();
part_type_sprite(parttype, s_pice, false, false, true);
part_type_size(parttype, 0.3, 0.5, 0, 0);
part_type_direction(parttype, 0, 360, 0, 0);
part_type_speed(parttype, 0.8, 1, 0, 0);
part_type_life(parttype, 5, 15);
ds_map_add(ds_part, PARTICLES.ICE, parttype);

parttype = part_type_create();
part_type_sprite(parttype, s_psparkle, true, false, false);
part_type_size(parttype, 0.1, 0.2, 0, 0);
part_type_direction(parttype, 0, 360, 0, 0);
part_type_speed(parttype, 1, 1.3, 0.1, 0);
part_type_life(parttype, 15, 30);
ds_map_add(ds_part, PARTICLES.SPARKLE, parttype);

parttype = part_type_create();
part_type_sprite(parttype, s_pfire1, true, false, false);
part_type_size(parttype, 1.2, 2, -0.2, 0);
part_type_direction(parttype, 30, 120, 0, 0);
part_type_speed(parttype, 1, 5.3, 0.2, 0);
ds_map_add(ds_part, PARTICLES.FIRE1, parttype);

parttype = part_type_create();
part_type_sprite(parttype, s_pfire2, true, false,false);
part_type_size(parttype, 1.2, 2, -0.2, 0);
part_type_direction(parttype, 30, 120, 0, 0);
part_type_speed(parttype, 1, 5.3, 0.2, 0);
ds_map_add(ds_part, PARTICLES.FIRE2, parttype);

parttype = part_type_create();
part_type_sprite(parttype, s_pfire3, true, false, false);
part_type_size(parttype, 1.2, 2, -0.2, 0);
part_type_direction(parttype, 30, 120, 0, 0);
part_type_speed(parttype, 1, 5.3, 0.2, 0);
ds_map_add(ds_part, PARTICLES.FIRE3, parttype);

parttype = part_type_create();
part_type_sprite(parttype, s_pember, false, false, true);
part_type_speed(parttype, 0.1, 0.2, -0.02, 0);
part_type_size(parttype, 0.4, 0.5, -0.1, 0);
part_type_life(parttype, 5, 8);
ds_map_add(ds_part, PARTICLES.EMBER, parttype);

parttype = part_type_create();
part_type_sprite(parttype, s_psmoke1, false, false, true);
part_type_alpha2(parttype, 0.5, 1);
part_type_speed(parttype, 1.5, 3, 0.5, 0);
part_type_size(parttype, 0.1, 0.2, 0.01, 0.02);
part_type_direction(parttype, 80, 110, 0, 0);
part_type_life(parttype, 10, 15);
ds_map_add(ds_part, PARTICLES.SMOKE1, parttype);

parttype = part_type_create();
part_type_sprite(parttype, s_psand, false, false, true);
part_type_size(parttype, 0.3, 0.5, -0.05, 0);
part_type_direction(parttype, 80, 110, 0, 0);
part_type_speed(parttype, 0.8, 1, 0, 0);
part_type_life(parttype, 5, 15);
ds_map_add(ds_part, PARTICLES.SAND, parttype);

parttype = part_type_create();
part_type_sprite(parttype, s_pslime, false, false, true);
part_type_size(parttype, 0.1, 0.2, 0, 0);
part_type_speed(parttype, 2, 4, 1, 0.5);
part_type_life(parttype, 10, 15);
part_type_direction(parttype, 270, 270, 0, 0);
ds_map_add(ds_part, PARTICLES.SLIME, parttype);


enum PARTICLES {
	WINTER, ICE, SPARKLE, FIRE1, FIRE2, FIRE3, EMBER, SMOKE1, SAND,
	SLIME
}