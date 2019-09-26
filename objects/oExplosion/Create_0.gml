/// @description Insert description here
// You can write your code in this editor

//parent shooter (player that shot)
parent = noone;
weapon_map = ds_map_create();

hitList = ds_list_create();
confirmList = ds_list_create();
image_angle = choose(0, 90, 180, 270);

//If it can hurt/affect the owner
//friendlyFire = false;
destroy = true;
//Do damage while explosion animation is going on
doing_damage = true;

first_step = false;
first_draw = false;

deathCause = noone;

if (!instance_exists(oShockwave))
	instance_create_depth(x, y, depth - 1, oShockwave);
else {
	with (oShockwave) {
		var new_wave = ds_list_create();
		new_wave[|waveparam.xx]		= other.x;
		new_wave[|waveparam.yy]		= other.y;
		new_wave[|waveparam.age]	= 0;
		new_wave[|waveparam.scale]	= 0;
		new_wave[|waveparam.alpha]	= 1;
		ds_list_add(list_of_waves, new_wave);
	}
}