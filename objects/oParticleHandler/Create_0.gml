/// @description Insert description here
// You can write your code in this editor

//Particles
global.ParticleSystem1 = part_system_create();
part_system_depth(global.ParticleSystem1,-50);

global.Emitter1 = part_emitter_create(global.ParticleSystem1);

partWinter = part_type_create();
part_type_sprite(partWinter,s_pwinter,false,false,false);
part_type_size(partWinter,0.1,1,-0.05,0);
part_type_direction(partWinter,270,270,0,0);
part_type_speed(partWinter,0.5,1,0.1,0);

partIce = part_type_create();
part_type_sprite(partIce, s_pice,false,false,true);
part_type_size(partIce,0.3,0.5,0,0);
part_type_direction(partIce,0,360,0,0);
part_type_speed(partIce,0.8,1,0,0);
part_type_life(partIce,5,15);

partSparkle = part_type_create();
part_type_sprite(partSparkle,s_psparkle,true,false,false);
part_type_size(partSparkle,0.1,0.2,0,0);
part_type_direction(partSparkle,0,360,0,0);
part_type_speed(partSparkle,1,1.3,0.1,0);
part_type_life(partSparkle,15,30);
