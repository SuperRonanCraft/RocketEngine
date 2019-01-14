///travel in a straight line


//First step
if(timer == EXPIRETIMER){
	//determine direction
	direction = 0;
	
	
	if(owner.team == TEAM.RIGHT){
		direction = 180;
	}
	
	
	//Find a target
	for (var i = 0; i < instance_number(pShootable); i += 1)
		if (instance_find(pShootable, i) != owner)
			target = instance_find(pShootable, i);	
}


if(pull){
	
	with(target){
	
		if(y > other.y){
			other.vsp_pull -= other.strength;	
		}
		else{
			other.vsp_pull += other.strength;	
		}
		if(x > other.x){
			other.hsp_pull -= other.strength;
		}
		else{
			other.hsp_pull += other.strength;	
		}
	
		vsp_move = 0;
		vsp_override = other.vsp_pull;
		hsp_override = other.hsp_pull;
	}

}


//Don't go too fast!
if(abs(hsp_pull) > MAXPULL){
	hsp_pull = sign(hsp_pull)*MAXPULL;	
}
if(abs(vsp_pull) > MAXPULL){
	vsp_pull = sign(vsp_pull)*MAXPULL;	
}

//Animate
if(owner.team == TEAM.RIGHT){
	image_angle += 5;	
}
else{
	image_angle -= 5;
}

if(timer < EXPIRETIMER/2){
	image_xscale += 0.05;
	image_yscale += 0.05;
}
else{
	image_xscale -= 0.05;
	image_yscale -= 0.05;
}

//Slow to a point and then start pulling opponent
if(speed > 0){
	speed -= 0.5;	
}
else{
	
	part_emitter_region(global.ParticleSystem1, global.Emitter1, x - 5, x + 5, y + 5, y - 5, ps_shape_ellipse, ps_distr_gaussian);
	part_emitter_burst(global.ParticleSystem1, global.Emitter1, oParticleHandler.ds_part[? PARTICLES.MAGNET], 50);	
	
	if(timer % 5 == 0){
		part_particles_create(global.ParticleSystem1,x,y,oParticleHandler.ds_part[? PARTICLES.PULL],1);
	}
	pull = true;	
}


timer--;

if(timer < 0){
	
	
	with(target){
		hsp_override = 0;
		vsp_override = 0;
		vsp_move = other.vsp_pull;
		
	}
	instance_destroy();
}	

