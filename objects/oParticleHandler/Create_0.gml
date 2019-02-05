/// @description Insert description here
// You can write your code in this editor

//Particles
global.ParticleSystem1 = part_system_create();
part_system_depth(global.ParticleSystem1, 100);

global.Emitter1 = part_emitter_create(global.ParticleSystem1);

//Initiate
ds_part = ds_map_create();
ds_part_amt = ds_map_create();
var spd = 0.5;
var life = 2;

var parttype = part_type_create();
part_type_sprite(parttype, s_pwinter, false, false, false);
part_type_size(parttype, 0.1, 1, -0.05, 0);
part_type_direction(parttype, 270, 270, 0, 0);
part_type_speed(parttype, 0.5 * spd, 1 * spd, 0.1 * spd, 0);
ds_map_add(ds_part, PARTICLES.WINTER, parttype);
ds_map_add(ds_part_amt, PARTICLES.WINTER, 1);

parttype = part_type_create();
part_type_sprite(parttype, s_pice, false, false, true);
part_type_size(parttype, 0.3, 0.5, 0, 0);
part_type_direction(parttype, 0, 360, 0, 0);
part_type_speed(parttype, 0.8 * spd, 1 * spd, 0, 0);
part_type_life(parttype, 5 * life, 15 * life);
ds_map_add(ds_part, PARTICLES.ICE, parttype);
ds_map_add(ds_part_amt, PARTICLES.ICE, 15);

parttype = part_type_create();
part_type_sprite(parttype, s_psparkle, true, false, true);
part_type_size(parttype, 0.1, 0.2, 0, 0);
part_type_direction(parttype, 0, 360, 0, 0);
part_type_speed(parttype, 1 * spd, 1.3 * spd, 0.1 * spd, 0);
part_type_life(parttype, 15 * life, 30 * life);
ds_map_add(ds_part, PARTICLES.SPARKLE, parttype);
ds_map_add(ds_part_amt, PARTICLES.SPARKLE, 5);

parttype = part_type_create();
part_type_sprite(parttype, s_pfire1, true, false, false);
part_type_size(parttype, 1.2, 2, -0.2, 0);
part_type_direction(parttype, 30, 120, 0, 0);
part_type_speed(parttype, 1 * spd, 5.3 * spd, 0.2 * spd, 0);
ds_map_add(ds_part, PARTICLES.FIRE1, parttype);
ds_map_add(ds_part_amt, PARTICLES.FIRE1, 20);

parttype = part_type_create();
part_type_sprite(parttype, s_pfire2, true, false,false);
part_type_size(parttype, 1.2, 2, -0.2, 0);
part_type_direction(parttype, 30, 120, 0, 0);
part_type_speed(parttype, 1 * spd, 5.3 * spd, 0.2 * spd, 0);
ds_map_add(ds_part, PARTICLES.FIRE2, parttype);
ds_map_add(ds_part_amt, PARTICLES.FIRE2, 20);

parttype = part_type_create();
part_type_sprite(parttype, s_pfire3, true, false, false);
part_type_size(parttype, 1.2, 2, -0.2, 0);
part_type_direction(parttype, 30, 120, 0, 0);
part_type_speed(parttype, 1 * spd, 5.3 * spd, 0.2 * spd, 0);
ds_map_add(ds_part, PARTICLES.FIRE3, parttype);
ds_map_add(ds_part_amt, PARTICLES.FIRE3, 20);

parttype = part_type_create();
part_type_sprite(parttype, s_pember, false, false, true);
part_type_speed(parttype, 0.1 * spd, 0.2 * spd, -0.02 * spd, 0);
part_type_size(parttype, 0.4, 0.5, -0.1, 0);
part_type_life(parttype, 5 * life, 8 * life);
ds_map_add(ds_part, PARTICLES.EMBER, parttype);
ds_map_add(ds_part_amt, PARTICLES.EMBER, 20);

parttype = part_type_create();
part_type_sprite(parttype, s_psmoke1, false, false, true);
part_type_alpha2(parttype, 0.5, 1);
part_type_speed(parttype, 1.5 * spd, 3 * spd, 0.5 * spd, 0);
part_type_size(parttype, 0.1, 0.2, 0.01, 0.02);
part_type_direction(parttype, 80, 110, 0, 0);
part_type_life(parttype, 10 * life, 15 * life);
ds_map_add(ds_part, PARTICLES.SMOKE1, parttype);
ds_map_add(ds_part_amt, PARTICLES.SMOKE1, 5);

parttype = part_type_create();
part_type_sprite(parttype, s_psmoke3, false, false, true);
part_type_alpha2(parttype, 0.5, 1);
part_type_speed(parttype, 0.25 * spd, 0.5 * spd, -0.01 * spd, 0);
part_type_size(parttype, 0.2, 0.4, -0.02, 0);
part_type_direction(parttype, 20, -20, 0, 0);
part_type_life(parttype, 10 * life, 15 * life);
ds_map_add(ds_part, PARTICLES.SMOKE3, parttype);
ds_map_add(ds_part_amt, PARTICLES.SMOKE3, 5);

parttype = part_type_create();
part_type_sprite(parttype, s_psand, false, false, true);
part_type_size(parttype, 0.3, 0.5, -0.05 * spd, 0.05 * spd);
part_type_direction(parttype, 90, 270, 0, 1);
part_type_speed(parttype, 0.75 * spd, 1.15 * spd, 0, 0);
part_type_life(parttype, 5 * life, 15 * life);
ds_map_add(ds_part, PARTICLES.SAND, parttype);
ds_map_add(ds_part_amt, PARTICLES.SAND, 15);

parttype = part_type_create();
part_type_sprite(parttype, s_pslime, false, false, true);
part_type_size(parttype, 0.1, 0.2, 0, 0);
part_type_speed(parttype, 0.8 * spd, 1.8 * spd, 0.4 * spd, 0.25 * spd);
part_type_life(parttype, 10 * life, 15 * life);
part_type_direction(parttype, 270, 270, 0, 0);
ds_map_add(ds_part, PARTICLES.SLIME, parttype);
ds_map_add(ds_part_amt, PARTICLES.SLIME, 5);

parttype = part_type_create();
part_type_sprite(parttype, s_pspeed, false, false, true);
part_type_size(parttype, 0.2, 0.6, 0, 0);
part_type_speed(parttype, 0, 0, 0, 0);
part_type_life(parttype, 4 * life, 9 * life);
//part_type_direction(parttype, 80, 100, 0, 0);
ds_map_add(ds_part, PARTICLES.SPEED, parttype);
ds_map_add(ds_part_amt, PARTICLES.SPEED, 10);

parttype = part_type_create();
part_type_sprite(parttype, s_plowgravity, true, true, false);
part_type_size(parttype, 0.5, 0.8, 0, 0);
part_type_speed(parttype, 1 * spd, 2 * spd, 0.5 * spd, 0.5 * spd);
part_type_life(parttype, 10 * life, 15 * life);
part_type_direction(parttype, 185, 355, 0, 0);
ds_map_add(ds_part, PARTICLES.LOWGRAVITY, parttype);
ds_map_add(ds_part_amt, PARTICLES.LOWGRAVITY, 5);

parttype = part_type_create();
part_type_sprite(parttype, s_preversecontrols, false, false, false);
part_type_size(parttype, 0.5, 0.75, -0.05 * spd, 0);
part_type_speed(parttype, 1 * spd, 1.5 * spd, 0.08 * spd, 0);
part_type_life(parttype, 12 * life, 25 * life);
part_type_direction(parttype, 0, 180, 0, 0);
ds_map_add(ds_part, PARTICLES.REVERSECONTROLS, parttype);
ds_map_add(ds_part_amt, PARTICLES.REVERSECONTROLS, 3);

parttype = part_type_create();
part_type_sprite(parttype, s_pultcharge, true, true, true);
part_type_size(parttype, 0.5, 0.8, 0.025 * spd, 0);
part_type_speed(parttype, 0.5 * spd, 1 * spd, 0.5 * spd, 0);
part_type_life(parttype, 10 * life, 15 * life);
part_type_direction(parttype, 10, 170, 0, 0);
part_type_gravity(parttype, 0.5 * spd, 90);
ds_map_add(ds_part, PARTICLES.ULTCHARGE, parttype);
ds_map_add(ds_part_amt, PARTICLES.ULTCHARGE, 1);

parttype = part_type_create();
part_type_sprite(parttype, s_psmoke2, false,false,true);
part_type_size(parttype,1,1.2,-0.05 * spd,0);
part_type_alpha1(parttype,0.8);
part_type_life(parttype,25 * life,25 * life);

ds_map_add(ds_part,PARTICLES.KBSMOKE,parttype);
ds_map_add(ds_part_amt, PARTICLES.KBSMOKE, 1);

parttype = part_type_create();
part_type_sprite(parttype, s_ptest, false,false,true);
part_type_size(parttype,1,1,0,0);
part_type_life(parttype,25 * life,25 * life);

ds_map_add(ds_part,PARTICLES.TEST,parttype);
ds_map_add(ds_part_amt, PARTICLES.TEST, 1);

parttype = part_type_create();
part_type_sprite(parttype, s_phitWall, true,true,false);
//part_type_size(parttype,1,1,0,0);
part_type_life(parttype,5 * life,5 * life);

ds_map_add(ds_part,PARTICLES.KBHIT,parttype);
ds_map_add(ds_part_amt, PARTICLES.KBHIT, 1);

parttype = part_type_create();
part_type_sprite(parttype, s_ptech, true,true,false);
//part_type_size(parttype,1,1,0,0);
part_type_life(parttype,5,5);

ds_map_add(ds_part,PARTICLES.TECH,parttype);
ds_map_add(ds_part_amt, PARTICLES.TECH, 1);

parttype = part_type_create();
part_type_sprite(parttype, s_pmagnetTrail,false,false,true);
part_type_direction(parttype,0,359,0,0);
part_type_life(parttype,3 * life,15 * life);
part_type_size(parttype,0.5,1,-0.1 * spd,0.1 * spd);
part_type_speed(parttype, 5 * spd, 10 * spd, -0.5 * spd, 0);

ds_map_add(ds_part,PARTICLES.MAGNET,parttype);
ds_map_add(ds_part_amt,PARTICLES.MAGNET,5);

parttype = part_type_create();
part_type_sprite(parttype, s_ppull,true,true,false);
part_type_orientation(parttype,0,359,0,0,0);
part_type_life(parttype,10 * life,15 * life);
part_type_size(parttype,1,1.5,0,0);
//part_type_speed(parttype,0,0,-0.01,-0.02);

ds_map_add(ds_part,PARTICLES.PULL,parttype);
ds_map_add(ds_part_amt,PARTICLES.PULL,5);

parttype = part_type_create();
part_type_sprite(parttype, s_pbleed, false, false, true);
part_type_size(parttype, 0.1, 0.5, -0.025 * spd, 0);
part_type_speed(parttype, -0.3 * spd, -1.85 * spd, -0.5 * spd, -0.6 * spd);
part_type_life(parttype, 10 * life, 15 * life);
part_type_direction(parttype, 0, 359, 0, 0);
part_type_orientation(parttype,0,359,0,0,0);
part_type_alpha3(parttype, 1, 1, 0);

ds_map_add(ds_part,PARTICLES.BLEED, parttype);
ds_map_add(ds_part_amt,PARTICLES.BLEED, 3);

parttype = part_type_create();
part_type_sprite(parttype, s_pblexplosion, true, true, false);
part_type_size(parttype, 1, 1.3, 0, 0);
part_type_speed(parttype, 0.5 * spd, 0.85 * spd, 0.3 * spd, -0.1 * spd);
part_type_life(parttype, 5 * life, 15 * life);
part_type_direction(parttype, 0, 359, 0, 0);
part_type_orientation(parttype,0,359,0,0,90);

ds_map_add(ds_part,PARTICLES.BLEEDEXPLOSION, parttype);
ds_map_add(ds_part_amt,PARTICLES.BLEEDEXPLOSION, 3);


parttype = part_type_create();
part_type_sprite(parttype, s_phack, false, false, true);
part_type_size(parttype, 0.8, 0.8, 0, 0);
part_type_direction(parttype, 90, 90, 0, 0);
part_type_speed(parttype, -0.8 * spd, 0.8 * spd, 0, 0);
part_type_alpha3(parttype, 1, 1, 0);
part_type_life(parttype, 15 * life, 30 * life);

ds_map_add(ds_part, PARTICLES.HACK, parttype);
ds_map_add(ds_part_amt, PARTICLES.HACK, 2);

parttype = part_type_create();
part_type_sprite(parttype, s_preversegravity, false, false, true);
part_type_size(parttype, 0.3, 0.5, 0, 0.02 * spd);
part_type_direction(parttype, 220, 320, 0, 0);
part_type_speed(parttype, 0.7 * spd, 0.9 * spd, 0, 0.1 * spd);
part_type_alpha3(parttype, 1, 1, 0);
part_type_life(parttype, 15 * life, 30 * life);

ds_map_add(ds_part, PARTICLES.REVERSEGRAVITY, parttype);
ds_map_add(ds_part_amt, PARTICLES.REVERSEGRAVITY, 1);


enum PARTICLES {
	WINTER, ICE, SPARKLE, FIRE1, FIRE2, FIRE3, EMBER, SMOKE1, SMOKE3, SAND,
	SLIME, SPEED, LOWGRAVITY, REVERSECONTROLS, ULTCHARGE, KBSMOKE,
	KBHIT, TECH, TEST, MAGNET, PULL, BLEED, HACK, REVERSEGRAVITY, BLEEDEXPLOSION,
}