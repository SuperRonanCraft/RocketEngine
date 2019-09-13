/// @description  Despawn

if (!debounce) {
	var randdirx = irandom_range(-7,7);
	var randdiry = irandom_range(-12,-8);
	
	image_speed = sign(randdirx);
	
	stuckTo = noone;
	deactivate = true;
	
	debounce = true;
	hsp = randdirx
	vsp = randdiry;
}

vsp += 1.1;
image_alpha -= 0.01;

x += hsp;
y += vsp;

//instance_destroy();