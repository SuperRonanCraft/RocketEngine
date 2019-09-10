/// @description  Despawn



if(!debounce){
	var randdirx = irandom_range(-7,7);
	var randdiry = irandom_range(-12,-8);
	
	image_speed = sign(randdirx);
	
	stuckTo = noone;
	deactivate = true;
	
	debounce = true;
	hsp = randdirx
	vsp = randdiry;

}

vsp += 2;


x += hsp;
y += vsp;

//instance_destroy();
