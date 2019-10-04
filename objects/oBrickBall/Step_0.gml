/// @description  


var particle1 = part_type_create();
part_type_shape(particle1,pt_shape_square);
part_type_size(particle1,0.10,0.20,-0.01,0);
part_type_scale(particle1,1,1);
part_type_color2(particle1,8421504,7502723);
part_type_alpha2(particle1,1,1);
part_type_speed(particle1,1,2,0.01,0);
part_type_direction(particle1,270,270,0,0);
part_type_orientation(particle1,0,0,0,0,1);
part_type_blend(particle1,0);
part_type_life(particle1,60,60);



if(image_xscale < 1){
	image_xscale += 0.1;	
}

image_yscale = image_xscale;

if(!destroy){
	
	image_angle += hsp*.3;
	
	uptime += 0.08;
	
	part_emitter_region(global.ParticleSystem1, global.Emitter1, bbox_left, bbox_right, bbox_top, bbox_bottom, ps_shape_ellipse, ps_distr_linear);
	part_emitter_burst(global.ParticleSystem1, global.Emitter1, particle1, 10);
	
	vsp += grv;
	
	if(image_xscale < 1)
		image_xscale += 0.1;	
}

image_yscale = image_xscale;

if(destroy && image_index == image_number-1){
	instance_destroy();	
}

if(instance_exists(owner)){
	x += hsp * owner.time_dialation;
	y += vsp * owner.time_dialation;
}
else{
	x += hsp;
	y += vsp;
}
