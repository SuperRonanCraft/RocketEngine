//Find a pShootable to hit
hit = instance_place(x,y,pShootable)
var size = image_xscale;

//We will be using DS Lists for collision. Please read below
//for reasons why.

if (size <= 0)
	instance_destroy();
//Deal the damange and buffs
for (var i = 0; i < ds_list_size(hitList); i++)
	if (ds_list_find_index(confirmList, hitList[| i]) == -1) {
		ds_list_add(confirmList, hitList[| i]);
		with (hitList[| i])
			scHitShootable(other.parent, false, true, other.rocket_map[? ROCKET_MAP.DAMAGE]);
		if (rocket_map[? ROCKET_MAP.BUFF] != noone)
			scAddBuff(rocket_map[? ROCKET_MAP.BUFF], hitList[| i]);
	}

//Make the flames look cool by individually spawning them on different frames!
part_emitter_region(global.ParticleSystem1,global.Emitter1,x-(size*30),x+(size*30),y- (size*10),y+(size*10),ps_shape_ellipse,ps_distr_gaussian);

if (image_index % 2 == 0)
	part_emitter_burst(global.ParticleSystem1, global.Emitter1, oParticleHandler.ds_part[? PARTICLES.FIRE1], 15*size);
else if (image_index % 3 == 0)
	part_emitter_burst(global.ParticleSystem1, global.Emitter1, oParticleHandler.ds_part[? PARTICLES.FIRE2], 14*size);
else
	part_emitter_burst(global.ParticleSystem1, global.Emitter1, oParticleHandler.ds_part[? PARTICLES.FIRE3], 13*size);
	
	
//Destroy the explosion once the animation ends
if(image_index > image_number - 1){
	instance_destroy();	
}