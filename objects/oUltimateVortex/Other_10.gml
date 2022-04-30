/// @description  Despawn



if(!debounce){
	rotate = true;
	var randdirx = irandom_range(hsp*.5,hsp);
	var randdiry = irandom_range(-abs(vsp) *1.1,-abs(vsp) * 0.5);
	
	image_speed = sign(randdirx);
	
	stuckTo = noone;
	deactivate = true;
	
	debounce = true;
	hsp = randdirx
	vsp = randdiry;
	if(instance_exists(stuckTo)){
		if(variable_instance_exists(stuckTo, "stuckAmount"))
			stuckTo.stuckAmount--;
	}
}
vsp += 2 * 5/room_speed;
image_alpha -= 0.01;
image_angle += hsp;
	

