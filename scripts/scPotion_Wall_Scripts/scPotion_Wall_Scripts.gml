function scPotion_Portal_WallScript() {


	if(!deactivate){
		var xplo = instance_create_depth(x,y,depth,oExplosion_Shuriken);
		xplo.sprite_index = sexplosion_Glass;
		xplo.owner = owner;
		xplo.image_xscale = 2;
		xplo.image_yscale = 2;
		ds_map_copy(xplo.weapon_map, weapon_map);
		ds_list_copy(xplo.hitList, hitList);
		deactivate = true;
		image_alpha = 0;
		scScreenShake(25,5);
		//instance_destroy();
	}


}

function scPotion_Electric_WallScript() {


	if(!deactivate){
		
		part_emitter_region(global.ParticleSystem1, global.Emitter1, bbox_left, bbox_right, bbox_top, bbox_bottom, ps_shape_ellipse, ps_distr_gaussian);
		part_emitter_burst(global.ParticleSystem1, global.Emitter1, oParticleHandler.ds_part[? PARTICLES.LIGHTNING], 20);
		var elec = instance_create_depth(x,y,depth,oUltimateLightning);
		elec.owner = owner;
		elec.stopped = true;
		elec.light_range /= 2;
		elec.dmg = ceil(dmg/5);
	}


}

function scPotion_Slime_WallScript() {


	if(!deactivate){
		var particle_range = 20;
		part_emitter_region(global.ParticleSystem1, global.Emitter1, bbox_left-particle_range, bbox_right+particle_range, bbox_top-particle_range, bbox_bottom+particle_range, ps_shape_ellipse, ps_distr_gaussian);
		part_emitter_burst(global.ParticleSystem1, global.Emitter1, oParticleHandler.ds_part[? PARTICLES.SLIME_PAINT], 20);
		
		for (var i = 0; i < 4; i++) {
			var slime = instance_create_depth(x,y,depth,oUltimateSludge);
			slime.owner = owner;
			slime.sludge_hsp = lengthdir_x(10,i*45);
			slime.sludge_vsp = lengthdir_y(10,i*45);
		}
	}


}
