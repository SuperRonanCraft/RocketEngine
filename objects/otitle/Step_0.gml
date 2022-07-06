/// @description  

timer+= 1*0.05;

y += 1*cos(timer);

part_emitter_region(global.ParticleSystem1, global.Emitter1, bbox_left,bbox_right,bbox_bottom, bbox_bottom+50,ps_shape_rectangle,ps_distr_linear);
part_emitter_burst(global.ParticleSystem1, global.Emitter1, oParticleHandler.ds_part[? PARTICLES.SMOKE5], 15);


part_emitter_region(global.ParticleSystem1, global.Emitter1, bbox_left,bbox_right,bbox_top, bbox_bottom,ps_shape_rectangle,ps_distr_linear);
part_emitter_burst(global.ParticleSystem1, global.Emitter1, oParticleHandler.ds_part[? PARTICLES.SMOKE4], 50);


