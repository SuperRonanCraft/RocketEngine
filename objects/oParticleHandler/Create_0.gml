/// @description Insert description here
// You can write your code in this editor

//Particles
global.ParticleSystem1 = part_system_create();
part_system_depth(global.ParticleSystem1, 99);

global.Emitter1 = part_emitter_create(global.ParticleSystem1);

//Initiate
ds_part = ds_map_create();
ds_part_amt = ds_map_create();
var spd = 0.5;
var life = 2;
var amt = 1;

var parttype = part_type_create();
part_type_sprite(parttype, s_pwinter, false, false, false);
part_type_size(parttype, 0.1, 1, -0.05, 0);
part_type_direction(parttype, 270, 270, 0, 0);
part_type_speed(parttype, 0.5 * spd, 1 * spd, 0.1 * spd, 0);
ds_map_add(ds_part, PARTICLES.WINTER, parttype);
ds_map_add(ds_part_amt, PARTICLES.WINTER, 2 * amt);

parttype = part_type_create();
part_type_sprite(parttype, s_pice, false, false, true);
part_type_size(parttype, 0.3, 0.5, 0, 0);
part_type_direction(parttype, 0, 360, 0, 0);
part_type_speed(parttype, 0.8 * spd, 1.1 * spd, 0, 0);
part_type_alpha3(parttype,1,0.8,0);
part_type_life(parttype, 5 * life, 15 * life);
ds_map_add(ds_part, PARTICLES.ICE, parttype);
ds_map_add(ds_part_amt, PARTICLES.ICE, 7 * amt);

parttype = part_type_create();
part_type_sprite(parttype, s_psparkle, true, false, true);
part_type_size(parttype, 0.1, 0.2, 0, 0);
part_type_direction(parttype, 0, 360, 0, 0);
part_type_speed(parttype, 1 * spd, 1.3 * spd, 0.1 * spd, 0);
part_type_life(parttype, 13 * life, 25 * life);
ds_map_add(ds_part, PARTICLES.SPARKLE, parttype);
ds_map_add(ds_part_amt, PARTICLES.SPARKLE, 5 * amt);

parttype = part_type_create();
part_type_sprite(parttype, s_pfire1, true, true, false);
part_type_size(parttype, 1, 2, -0.02, 0);
part_type_direction(parttype, 30, 120, 0, 0);
part_type_life(parttype,12,18);
part_type_speed(parttype, 1 * spd, 5.3 * spd, 0.2 * spd, 0);
ds_map_add(ds_part, PARTICLES.FIRE1, parttype);
ds_map_add(ds_part_amt, PARTICLES.FIRE1, 5 * amt);

parttype = part_type_create();
part_type_sprite(parttype, s_pfire2, true, true,false);
part_type_size(parttype, 0.5, 1, -0.02, 0);
part_type_direction(parttype, 30, 120, 0, 0);
part_type_speed(parttype, 1 * spd, 5.3 * spd, 0.2 * spd, 0);
part_type_life(parttype,15,20);
ds_map_add(ds_part, PARTICLES.FIRE2, parttype);
ds_map_add(ds_part_amt, PARTICLES.FIRE2, 20 * amt);

parttype = part_type_create();
part_type_sprite(parttype, s_pfire3, true, false, false);
part_type_size(parttype, 1.2, 2, 0, 0);
part_type_direction(parttype, 30, 120, 0, 0);
part_type_life(parttype, 5 * life, 7 * life);
//part_type_speed(parttype, 1 * spd, 5.3 * spd, 0.2 * spd, 0);
ds_map_add(ds_part, PARTICLES.FIRE3, parttype);
ds_map_add(ds_part_amt, PARTICLES.FIRE3, 20 * amt);

parttype = part_type_create();
part_type_shape(parttype,pt_shape_square);
part_type_size(parttype,0.125,0.2,-0.005,0);
part_type_scale(parttype,1,1);
part_type_color3(parttype,8454143,4227327,255);
part_type_alpha3(parttype,1,0.8,0);
part_type_speed(parttype,1,1.2,0,0);
part_type_direction(parttype,0,359,0,0);
part_type_gravity(parttype,0.1,90);
part_type_orientation(parttype,0,0,0,1,0);
part_type_blend(parttype,1);
part_type_life(parttype,10,30);
/*part_type_sprite(parttype, s_pember, false, false, true);
part_type_speed(parttype, 0.4 * spd, 0.7 * spd, -0.02 * spd, 0);
part_type_size(parttype, 0.5, 0.6, -0.08 * spd, 0);
part_type_life(parttype, 6 * life, 10 * life);*/
ds_map_add(ds_part, PARTICLES.EMBER, parttype);
ds_map_add(ds_part_amt, PARTICLES.EMBER, 3 * amt);

parttype = part_type_create();
part_type_sprite(parttype, s_psmoke1, false, false, true);
part_type_alpha2(parttype, 0.5, 1);
part_type_speed(parttype, 1.5 * spd, 3 * spd, 0.5 * spd, 0);
part_type_size(parttype, 0.1, 0.2, 0.01, 0.02);
part_type_direction(parttype, 80, 110, 0, 0);
part_type_life(parttype, 5 * life, 11 * life);
ds_map_add(ds_part, PARTICLES.SMOKE1, parttype);
ds_map_add(ds_part_amt, PARTICLES.SMOKE1, 2 * amt);

parttype = part_type_create();
part_type_shape(parttype,pt_shape_square);
part_type_size(parttype,0.1,0.2,0,0);
part_type_scale(parttype,1,1);
part_type_color3(parttype,8421504,128,16777215);
part_type_alpha3(parttype,1,1,0);
part_type_speed(parttype,1,1,0,0);
part_type_direction(parttype,0,359,0,0);
part_type_gravity(parttype,0,270);
part_type_orientation(parttype,0,0,0,1,1);
part_type_blend(parttype,1);
part_type_life(parttype,30,50);
ds_map_add(ds_part, PARTICLES.SMOKE2, parttype);
ds_map_add(ds_part_amt, PARTICLES.SMOKE2, 1 * amt);

parttype = part_type_create();
part_type_shape(parttype,pt_shape_square);
part_type_size(parttype,0.10,0.30,-0.01,0);
part_type_scale(parttype,1,1);
part_type_color3(parttype,4210816,4227327,0);
part_type_alpha3(parttype,1,1,0);
part_type_speed(parttype,1,1,0,0);
part_type_direction(parttype,0,359,0,0);
part_type_gravity(parttype,0.01,90);
part_type_orientation(parttype,0,0,0,1,0);
part_type_blend(parttype,1);
part_type_life(parttype,40,60);
/*
part_type_sprite(parttype, s_psmoke3, false, false, true);
part_type_alpha2(parttype, 0.5, 1);
part_type_speed(parttype, 0.25 * spd, 0.5 * spd, -0.01 * spd, 0);
part_type_size(parttype, 0.2, 0.4, -0.02, 0);
part_type_direction(parttype, 20, -20, 0, 0);
part_type_life(parttype, 10 * life, 15 * life);*/
ds_map_add(ds_part, PARTICLES.SMOKE3, parttype);
ds_map_add(ds_part_amt, PARTICLES.SMOKE3, 5 * amt);

parttype = part_type_create();
part_type_shape(parttype,pt_shape_square);
part_type_size(parttype,0.10,0.10,0,0);
part_type_scale(parttype,1,1);
part_type_color1(parttype,7451122);
part_type_alpha2(parttype,1,0);
part_type_speed(parttype,0.50,1,-0.02,0);
part_type_direction(parttype,0,359,0,0);
part_type_gravity(parttype,0,270);
part_type_orientation(parttype,0,0,0,0,1);
part_type_blend(parttype,1);
part_type_life(parttype,40,60);

/*part_type_sprite(parttype, s_psand, false, false, true);
part_type_size(parttype, 0.4, 0.6, 0.02 * spd, 0);
part_type_direction(parttype, 90, 270, 0, 1);
part_type_alpha3(parttype,1,0.6,0);
part_type_speed(parttype, 0.75 * spd, 1.2 * spd, 0, 0);
part_type_life(parttype, 15 * life, 30 * life);*/
ds_map_add(ds_part, PARTICLES.SAND, parttype);
ds_map_add(ds_part_amt, PARTICLES.SAND, 1 * amt);

parttype = part_type_create();
part_type_sprite(parttype, s_pslime, false, false, true);
part_type_size(parttype, 0.1, 0.2, 0, 0);
part_type_speed(parttype, 0.8 * spd, 1.8 * spd, 0.3 * spd, 0.2 * spd);
part_type_life(parttype, 10 * life, 15 * life);
part_type_direction(parttype, 265, 275, 0, 0);
ds_map_add(ds_part, PARTICLES.SLIME, parttype);
ds_map_add(ds_part_amt, PARTICLES.SLIME, 3 * amt);

parttype = part_type_create();
part_type_sprite(parttype, s_pspeed, false, false, true);
part_type_size(parttype, 0.2, 0.6, 0, 0);
part_type_speed(parttype, 0, 0, 0, 0);
part_type_life(parttype, 4 * life, 9 * life);
//part_type_direction(parttype, 80, 100, 0, 0);
ds_map_add(ds_part, PARTICLES.SPEED, parttype);
ds_map_add(ds_part_amt, PARTICLES.SPEED, 5 * amt);

parttype = part_type_create();
part_type_sprite(parttype, s_plowgravity, true, true, false);
part_type_size(parttype, 0.5, 0.8, 0, 0);
part_type_speed(parttype, 0.8 * spd, 1.8 * spd, 0.4 * spd, 0.4 * spd);
part_type_life(parttype, 10 * life, 15 * life);
part_type_direction(parttype, 185, 355, 0, 0);
ds_map_add(ds_part, PARTICLES.LOWGRAVITY, parttype);
ds_map_add(ds_part_amt, PARTICLES.LOWGRAVITY, 4 * amt);

parttype = part_type_create();
part_type_sprite(parttype, s_preversecontrols, false, false, false);
part_type_size(parttype, 0.5, 0.75, -0.05 * spd, 0);
part_type_speed(parttype, 1 * spd, 1.5 * spd, 0.08 * spd, 0);
part_type_life(parttype, 12 * life, 25 * life);
part_type_direction(parttype, 0, 180, 0, 0);
ds_map_add(ds_part, PARTICLES.REVERSECONTROLS, parttype);
ds_map_add(ds_part_amt, PARTICLES.REVERSECONTROLS, 1 * amt);

parttype = part_type_create();
part_type_sprite(parttype, s_pultcharge, true, true, true);
part_type_size(parttype, 0.5, 0.8, 0.025 * spd, 0);
part_type_speed(parttype, 0.5 * spd, 1 * spd, 0.5 * spd, 0);
part_type_life(parttype, 5 * life, 10 * life);
part_type_direction(parttype, 10, 170, 0, 0);
part_type_gravity(parttype, 0.5 * spd, 90);
ds_map_add(ds_part, PARTICLES.ULTCHARGE, parttype);
ds_map_add(ds_part_amt, PARTICLES.ULTCHARGE, 1 * amt);

//KNOCKBACK SMOKE
parttype = part_type_create();
part_type_sprite(parttype, s_psmoke2, false, false, true);
part_type_size(parttype, 1, 1.2, -0.05 * spd, 0);
part_type_alpha1(parttype, 0.8);
part_type_life(parttype, 25 * life, 25 * life);

ds_map_add(ds_part, PARTICLES.KBSMOKE, parttype);
ds_map_add(ds_part_amt, PARTICLES.KBSMOKE, 1 * amt);

parttype = part_type_create();
part_type_sprite(parttype, s_ptest, false, false, true);
part_type_size(parttype, 1, 1, 0, 0);
part_type_life(parttype, 25 * life, 25 * life);

ds_map_add(ds_part, PARTICLES.TEST, parttype);
ds_map_add(ds_part_amt, PARTICLES.TEST, 1 * amt);

parttype = part_type_create();
part_type_sprite(parttype, s_phitWall, true, true, false);
//part_type_size(parttype,1,1,0,0);
part_type_life(parttype, 5 * life, 5 * life);

ds_map_add(ds_part, PARTICLES.KBHIT, parttype);
ds_map_add(ds_part_amt, PARTICLES.KBHIT, 1 * amt);

parttype = part_type_create();
part_type_sprite(parttype, s_ptech, true, true, false);
//part_type_size(parttype,1,1,0,0);
part_type_life(parttype, 5, 5);

ds_map_add(ds_part, PARTICLES.TECH, parttype);
ds_map_add(ds_part_amt, PARTICLES.TECH, 1 * amt);

parttype = part_type_create();
part_type_sprite(parttype, s_pmagnetTrail, false, false, true);
part_type_direction(parttype, 0, 359, 0, 0);
part_type_life(parttype, 15 * life, 30 * life);
part_type_size(parttype, 0.5, 1, -0.1 * spd, 0.1 * spd);
part_type_speed(parttype, 5 * spd, 10 * spd, -0.5 * spd, 0);

ds_map_add(ds_part,PARTICLES.MAGNET,parttype);
ds_map_add(ds_part_amt,PARTICLES.MAGNET, 4 * amt);

parttype = part_type_create();
part_type_sprite(parttype, s_ppull, true, true, false);
part_type_orientation(parttype, 0, 359, 0, 0, 0);
part_type_life(parttype, 10 * life, 15 * life);
part_type_size(parttype, 1, 1.5, 0, 0);
//part_type_speed(parttype,0,0,-0.01,-0.02);

ds_map_add(ds_part, PARTICLES.PULL, parttype);
ds_map_add(ds_part_amt, PARTICLES.PULL, 5 * amt);

parttype = part_type_create();
part_type_sprite(parttype, s_pbleed, false, false, true);
part_type_size(parttype, 0.1, 0.5, -0.025 * spd, 0);
part_type_speed(parttype, -0.3 * spd, -1.85 * spd, -0.5 * spd, -0.6 * spd);
part_type_life(parttype, 10 * life, 15 * life);
part_type_direction(parttype, 0, 359, 0, 0);
part_type_orientation(parttype, 0, 359, 0, 0, 0);
part_type_alpha3(parttype, 1, 1, 0);

ds_map_add(ds_part, PARTICLES.BLEED, parttype);
ds_map_add(ds_part_amt, PARTICLES.BLEED, 1 * amt);

parttype = part_type_create();
part_type_sprite(parttype, s_pblexplosion, true, true, false);
part_type_size(parttype, 1, 1.3, 0, 0);
part_type_speed(parttype, 0.5 * spd, 0.85 * spd, 0.3 * spd, -0.1 * spd);
part_type_life(parttype, 5 * life, 15 * life);
part_type_direction(parttype, 0, 359, 0, 0);
part_type_orientation(parttype, 0, 359, 0, 0, 90);

ds_map_add(ds_part, PARTICLES.BLEEDEXPLOSION, parttype);
ds_map_add(ds_part_amt, PARTICLES.BLEEDEXPLOSION, 3 * amt);


parttype = part_type_create();
part_type_sprite(parttype, s_phack, false, false, true);
part_type_size(parttype, 0.8, 0.8, 0, 0);
part_type_direction(parttype, 90, 90, 0, 0);
part_type_speed(parttype, 0.1 * spd, 0.8 * spd, 0, 0);
part_type_alpha3(parttype, 1, 1, 0);
part_type_life(parttype, 15 * life, 30 * life);

ds_map_add(ds_part, PARTICLES.HACK, parttype);
ds_map_add(ds_part_amt, PARTICLES.HACK, 2 * amt);

parttype = part_type_create();
part_type_sprite(parttype, s_preversegravity, false, false, true);
part_type_size(parttype, 0.3, 0.5, 0, 0.02 * spd);
part_type_direction(parttype, 270, 270, 0, 0);
part_type_speed(parttype, 1 * spd, 1.9 * spd, 0, 0.1 * spd);
part_type_alpha3(parttype, 1, 1, 0);
part_type_life(parttype, 15 * life, 30 * life);
part_type_gravity(parttype,0.1,90);

ds_map_add(ds_part, PARTICLES.REVERSEGRAVITY, parttype);
ds_map_add(ds_part_amt, PARTICLES.REVERSEGRAVITY, 1 * amt);

parttype = part_type_create();
part_type_sprite(parttype, s_pslowmo, false, false, false);
part_type_size(parttype, 0.2, 0.6, 0, 0);
part_type_speed(parttype, 0, 0, 0, 0);
part_type_life(parttype, 14 * life, 20 * life);

ds_map_add(ds_part, PARTICLES.SLOWMO, parttype);
ds_map_add(ds_part_amt, PARTICLES.SLOWMO, 1 * amt);

parttype = part_type_create();
part_type_sprite(parttype, s_ppeace, true, false, true);
part_type_size(parttype, 0.5, 0.5, 0 * spd, 0);
part_type_direction(parttype, 0, 0, 0, 0);
part_type_life(parttype, 5 * life, 5 * life);
ds_map_add(ds_part, PARTICLES.PEACE, parttype);
ds_map_add(ds_part_amt, PARTICLES.PEACE, 1 * amt);

//SLEEP
parttype = part_type_create();
part_type_sprite(parttype, s_psleep, false, false, true);
part_type_size(parttype, 0.3, 0.5, 0.02 * spd, 0);
part_type_direction(parttype, 45, 135, -15, 20);
part_type_speed(parttype, 0.1 * spd, 0.2 * spd, 0.05 * spd, -0.06);
part_type_life(parttype, 13 * life, 20 * life);
part_type_gravity(parttype,0.5,180);
ds_map_add(ds_part, PARTICLES.SLEEP, parttype);
ds_map_add(ds_part_amt, PARTICLES.SLEEP, 1 * amt);

//PORTAL
parttype = part_type_create();
part_type_shape(parttype,pt_shape_square);
part_type_size(parttype,.1,.1,0,0);
part_type_scale(parttype,1/2,1/2);
part_type_color3(parttype,8404992,2230060,6495361);
part_type_alpha3(parttype,1,0.5,0.04);
part_type_speed(parttype,1.84,2.26,0.12,0);
part_type_direction(parttype,0,359,1,0);
part_type_gravity(parttype,0,270);
part_type_orientation(parttype,0,0,0,0,1);
part_type_blend(parttype,1);
part_type_life(parttype,36,69);
/*part_type_sprite(parttype, s_pportal, true, false, true);
part_type_size(parttype, 0.2, 0.3, 0, 0);
part_type_direction(parttype, 0, 360, 0, 0);
part_type_speed(parttype, 1 * spd, 1.3 * spd, -0.01 * spd, 0);
part_type_life(parttype, 13 * life, 25 * life);*/
ds_map_add(ds_part, PARTICLES.PORTAL, parttype);
ds_map_add(ds_part_amt, PARTICLES.PORTAL, 5 * amt);

//DUST
parttype = part_type_create();
part_type_sprite(parttype, s_pdust, true, true, false);
part_type_size(parttype, 0.8, 1.2, 0, 0);
part_type_speed(parttype, 1.5 * spd, 2.5 * spd, -0.03 * spd, 0);
part_type_gravity(parttype, 0.06 * spd, 90);
part_type_life(parttype, 8 * 3, 11 * 3);
ds_map_add(ds_part, PARTICLES.DUST, parttype);
ds_map_add(ds_part_amt, PARTICLES.DUST, 5 * amt);

//DAMAGE
parttype = part_type_create();
part_type_sprite(parttype, s_pdamageboost, true, false, false);
part_type_size(parttype, 1, 1, -0.05 * spd, 0);
part_type_speed(parttype, 5 * spd, 5 * spd, -0.01 * spd, 0);
part_type_life(parttype, 15 * life, 15 * life);
part_type_direction(parttype, 90, 90, 0, 0);
ds_map_add(ds_part, PARTICLES.DAMAGE, parttype);
ds_map_add(ds_part_amt, PARTICLES.DAMAGE, 1);

//ANTIHEAL
parttype = part_type_create();
part_type_sprite(parttype, s_pantiheal, false, false, true);
part_type_size(parttype, 0.3, 0.4, -0.025 * spd, 0);
part_type_speed(parttype, 0.5 * spd, 1 * spd, 0.5 * spd, 0);
part_type_life(parttype, 5 * life, 10 * life);
part_type_direction(parttype, 0, 65, 115, 0);
ds_map_add(ds_part, PARTICLES.ANTIHEAL, parttype);
ds_map_add(ds_part_amt, PARTICLES.ANTIHEAL, 1);

//ABSORBTION
parttype = part_type_create();
part_type_sprite(parttype, s_pabsorbtion, false, false, false);
part_type_size(parttype, 0.45, 0.7, -0.005 * spd, 0);
part_type_speed(parttype, 3 * spd, 5 * spd, -0.01 * spd, 0);
part_type_life(parttype, 10 * life, 15 * life);
part_type_direction(parttype, 80, 100, 0, 0);
ds_map_add(ds_part, PARTICLES.ABSORBTION, parttype);
ds_map_add(ds_part_amt, PARTICLES.ABSORBTION, 1);

//LIFE-STEAL
parttype = part_type_create();
part_type_sprite(parttype, s_plifesteal, true, true, false);
part_type_size(parttype, 0.5, 0.8, -0.005 * spd, 0);
part_type_speed(parttype, 5 * spd, 7 * spd, -0.02 * spd, 0);
part_type_life(parttype, 10 * life, 15 * life);
part_type_direction(parttype, 60, 120, 0, 0);
ds_map_add(ds_part, PARTICLES.LIFESTEAL, parttype);
ds_map_add(ds_part_amt, PARTICLES.LIFESTEAL, 2);

//CLEANSE
parttype = part_type_create();
part_type_sprite(parttype, s_pcleanse, false, false, true);
part_type_size(parttype, 0.8, 1.8, -0.005 * spd, 0);
part_type_speed(parttype, 3 * spd, 5 * spd, -0.01 * spd, 0);
part_type_life(parttype, 10 * life, 15 * life);
part_type_direction(parttype, 60, 120, 0, 0);
part_type_alpha3(parttype, 1, 0.5, 0);
ds_map_add(ds_part, PARTICLES.CLEANSE, parttype);
ds_map_add(ds_part_amt, PARTICLES.CLEANSE, 2);

//TRAIL
parttype = part_type_create();
part_type_sprite(parttype, s_ptrail, false, false, false);
part_type_size(parttype, 1, 1, 0, 0);
part_type_life(parttype, 15 * life, 15 * life);
ds_map_add(ds_part, PARTICLES.TRAIL, parttype);
ds_map_add(ds_part_amt, PARTICLES.TRAIL, 5);

//RELOAD
parttype = part_type_create();
part_type_sprite(parttype, s_preload, true, true, false);
part_type_direction(parttype,90,90,0,0);
part_type_speed(parttype,0.5,0.5,-0.05,0);
part_type_alpha3(parttype,1,0.7,0.3);
part_type_size(parttype, 1, 1, 0, 0);
part_type_life(parttype, 15 * life, 15 * life);
ds_map_add(ds_part, PARTICLES.RELOAD, parttype);
ds_map_add(ds_part_amt, PARTICLES.RELOAD, 1);

//ASH
parttype = part_type_create();
part_type_sprite(parttype, s_pash, true,true,false);
part_type_life(parttype, 5,25);
part_type_direction(parttype, 0,360,5,-10);
part_type_speed(parttype,0.1,0.3,0,0);
part_type_size(parttype,0.5,1,0,0);
ds_map_add(ds_part,PARTICLES.ASH,parttype);
ds_map_add(ds_part_amt, PARTICLES.ASH, 5);

//FROST
parttype = part_type_create();
part_type_sprite(parttype, s_pfrost, false,false,false);
part_type_life(parttype,5,10);
part_type_direction(parttype,99,81,1,-2);
part_type_speed(parttype,1,3,-0.1,0);
part_type_size(parttype,0.5,1,-0.05,0);
ds_map_add(ds_part,PARTICLES.FROST,parttype);
ds_map_add(ds_part_amt, PARTICLES.FROST, 3);

//LIGHTNING
parttype = part_type_create();
part_type_shape(parttype,pt_shape_square);
part_type_size(parttype,0.05,0.1,0,0);
part_type_color3(parttype,15061023,16777088,16777215);
part_type_alpha3(parttype,0.69,0.58,0.06);
part_type_speed(parttype,1,2,-0.02,2);
part_type_direction(parttype,0,360,0,0);
part_type_gravity(parttype,0,270);
part_type_blend(parttype,1);
part_type_life(parttype,20,30);
ds_map_add(ds_part,PARTICLES.LIGHTNING, parttype);
ds_map_add(ds_part_amt, PARTICLES.LIGHTNING, 3);

//SCRAPE_FLARE
parttype = part_type_create();
part_type_shape(parttype,pt_shape_square);
part_type_size(parttype,0.10,0.15,-0.01,0);
part_type_scale(parttype,1,1);
part_type_color2(parttype,4227327,16777215);
part_type_alpha2(parttype,1,0);
part_type_speed(parttype,1.5,2,-0.02,1);
part_type_direction(parttype,0,359,0,0);
part_type_gravity(parttype,0,270);
part_type_orientation(parttype,0,0,0,0,0);
part_type_blend(parttype,1);
part_type_life(parttype,60,60);
ds_map_add(ds_part,PARTICLES.SCRAPE_FLARE, parttype);
ds_map_add(ds_part_amt, PARTICLES.SCRAPE_FLARE, 1);

//SCRAPING
parttype = part_type_create();
part_type_shape(parttype,pt_shape_square);
part_type_size(parttype,0.05,0.15,0,0);
part_type_scale(parttype,1,1);
part_type_color3(parttype,16777215,33023,65535);
part_type_alpha1(parttype,1);
part_type_speed(parttype,2,2.50,-0.02,1);
part_type_direction(parttype,0,359,0,0);
part_type_gravity(parttype,0,270);
part_type_orientation(parttype,0,0,0,0,0);
part_type_blend(parttype,1);
part_type_life(parttype,4,8);
part_type_death(parttype, 3, ds_part[? PARTICLES.SCRAPE_FLARE]);
ds_map_add(ds_part,PARTICLES.SCRAPING, parttype);
ds_map_add(ds_part_amt, PARTICLES.SCRAPING, 1);

//METAL
parttype = part_type_create();
part_type_shape(parttype,pt_shape_square);
part_type_size(parttype,0.08,0.12,0,0);
part_type_scale(parttype,1,1);
part_type_color2(parttype,128,0);
part_type_alpha2(parttype,1,0);
part_type_speed(parttype,0.50,1,0,0);
part_type_direction(parttype,0,359,0,0);
part_type_gravity(parttype,0,270);
part_type_orientation(parttype,0,0,0,0,1);
part_type_blend(parttype,1);
part_type_life(parttype,40,60);
ds_map_add(ds_part,PARTICLES.METAL, parttype);
ds_map_add(ds_part_amt, PARTICLES.METAL, 1);

//EXPLOSION
parttype = part_type_create();
part_type_sprite(parttype,s_pExplosionPixel,0,0,true);
part_type_size(parttype,1,1,-0.01,0);
part_type_scale(parttype,1,1);
part_type_color3(parttype,255,33023,65535);
part_type_alpha3(parttype,1,0.30,0.10);
part_type_speed(parttype,2,3,0,0);
part_type_direction(parttype,80,110,0,0);
part_type_gravity(parttype,0.10,270);
part_type_orientation(parttype,0,0,0,0,0);
part_type_blend(parttype,1);
part_type_life(parttype,90,180);
ds_map_add(ds_part,PARTICLES.EXPLOSION_DEFAULT, parttype);
ds_map_add(ds_part_amt, PARTICLES.EXPLOSION_DEFAULT, 25);

//Slime
parttype = part_type_create();
part_type_shape(parttype,pt_shape_disk);
part_type_size(parttype,0.10,0.80,-0.01,0);
part_type_scale(parttype,1,1);
part_type_color1(parttype,4259584);
part_type_alpha1(parttype,1);
part_type_speed(parttype,1,3,-0.02,0);
part_type_direction(parttype,0,359,0,0);
part_type_gravity(parttype,0,270);
part_type_orientation(parttype,0,0,0,0,1);
part_type_blend(parttype,0);
part_type_life(parttype,60,60);
ds_map_add(ds_part,PARTICLES.SLIME_PAINT, parttype);
ds_map_add(ds_part_amt, PARTICLES.SLIME_PAINT, 25);

//Shield Damage
parttype = part_type_create();
part_type_sprite(parttype,s_pShieldDamage,1,1,0);
part_type_size(parttype,1,2.5,-0.01,0.02);
part_type_speed(parttype,1,3,-0.01,0);
part_type_direction(parttype,0,359,0,0);
part_type_gravity(parttype,0.01,90);
part_type_blend(parttype,0);
part_type_life(parttype,30,60);
ds_map_add(ds_part,PARTICLES.SHIELD_DAMAGE, parttype);
ds_map_add(ds_part_amt, PARTICLES.SHIELD_DAMAGE, 5);

//ARMOR DAMAGE
parttype = part_type_create();
part_type_sprite(parttype,s_pArmorDamage,1,1,0);
part_type_size(parttype,1.5,2,-0.01,0);
part_type_scale(parttype,1,1);
part_type_alpha1(parttype,1);
part_type_speed(parttype,1,2,0,0);
part_type_direction(parttype,0,359,0,0);
part_type_gravity(parttype,0.03,270);
part_type_blend(parttype,0);
part_type_life(parttype,30,60);
ds_map_add(ds_part,PARTICLES.ARMOR_DAMAGE, parttype);
ds_map_add(ds_part_amt, PARTICLES.ARMOR_DAMAGE, 5);


//HEALTH DAMAGE
parttype = part_type_create();
part_type_sprite(parttype,s_pHealthDamage,1,1,0);
part_type_size(parttype,0.80,1,0,0);
part_type_scale(parttype,1.5,2);
part_type_color1(parttype,255);
part_type_alpha1(parttype,1);
part_type_speed(parttype,2,3,-0.10,0);
part_type_direction(parttype,0,359,0,0);
part_type_orientation(parttype,0,0,0,0,1);
part_type_blend(parttype,0);
part_type_life(parttype,30,40);
ds_map_add(ds_part,PARTICLES.HEALTH_DAMAGE, parttype);
ds_map_add(ds_part_amt, PARTICLES.HEALTH_DAMAGE, 5);

enum PARTICLES {
	WINTER, ICE, SPARKLE, FIRE1, FIRE2, FIRE3, EMBER, SMOKE1, SMOKE2, SMOKE3, SAND,
	SLIME, SPEED, LOWGRAVITY, REVERSECONTROLS, ULTCHARGE, KBSMOKE,
	KBHIT, TECH, TEST, MAGNET, PULL, BLEED, HACK, REVERSEGRAVITY, BLEEDEXPLOSION,
	SLOWMO, PEACE, SLEEP, PORTAL, DUST, DAMAGE, ANTIHEAL, ABSORBTION, LIFESTEAL,
	CLEANSE, TRAIL, RELOAD, ASH, FROST, LIGHTNING, SCRAPING, SCRAPE_FLARE, METAL,
	EXPLOSION_DEFAULT, SLIME_PAINT,SHIELD_DAMAGE,ARMOR_DAMAGE,HEALTH_DAMAGE,
}