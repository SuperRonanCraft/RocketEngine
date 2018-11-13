///@desc Ice Rocket's particle effects

part_emitter_region(global.ParticleSystem1,global.Emitter1,x-(x - bbox_left)-5,x-5,y-5,y+5,ps_shape_ellipse,ps_distr_gaussian)
part_emitter_burst(global.ParticleSystem1,global.Emitter1,oParticleHandler.partIce,4);
