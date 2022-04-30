function scUltimateVortex() {

	var dir = argument[0];
	var vortex = instance_create_depth(x, y, depth - 20, oUltimateVortex);
	
	part_emitter_region(global.ParticleSystem1, global.Emitter1, x-20,x+20,y-20,y+20,ps_shape_ellipse, ps_distr_gaussian);
	part_emitter_burst(global.ParticleSystem1, global.Emitter1, oParticleHandler.ds_part[? PARTICLES.DUST], 30);
	
	facing = dir > -90 && dir <= 90 ? 1 : -1;

	vortex.hsp = facing*50;
	var _map = gravity_map;
	
	_map[? GRAVITY_MAP.HSP_MOVE] -= (facing * 5);

	vortex.owner = id;
	vortex.timer = 500;

	with (vortex)
		image_xscale = other.facing;	



}
