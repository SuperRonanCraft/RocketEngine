/// @desc collision with oWall

if (first_step) exit;

scExplosionTiles();
first_step = true;

if (!instance_exists(oShockwave))
	instance_create_depth(x, y, depth - 1, oShockwave);
with (oShockwave) {
	var new_wave = ds_list_create();
	new_wave[|waveparam.xx]		= other.x;
	new_wave[|waveparam.yy]		= other.y;
	new_wave[|waveparam.age]	= 0;
	new_wave[|waveparam.scale]	= 0;
	new_wave[|waveparam.alpha]	= 1;
	new_wave[|waveparam.scale_max] = ((RES_W / 4) / sprite_get_width(sprite)) * (other.weapon_map[? WEAPON_MAP.DAMAGE] / 2);
	ds_list_add(list_of_waves, new_wave);
}