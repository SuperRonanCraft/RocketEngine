/// @desc

var _n = instance_number(oPlayer);

for (var i = 0; i < _n; i++) {
	var _p = instance_find(oPlayer, i);
	if (round(_p.y + (_p.sprite_height / 2)) > y)
		mask_index = -1;
	else
		mask_index = sBarrier;
}