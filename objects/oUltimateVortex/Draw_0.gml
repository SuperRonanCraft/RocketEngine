/// @description  


if (sprite_index != noone)
	draw_self();

if(!deactivate){
	part_particles_create(global.ParticleSystem1, x, y, oParticleHandler.ds_part[? PARTICLES.DUST], 1);
}

else{
	part_particles_create(global.ParticleSystem1, x, y, oParticleHandler.ds_part[? PARTICLES.PULL], 3);	
}

//draw_circle(x,y,pullRadius, true);
//Show collision box while in debug mode
if (global.debug)
	scDrawRect(bbox_left, bbox_top, bbox_right, bbox_bottom, c_blue, true, 1);