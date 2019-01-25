var val = -1;
for (var i = 0; i < 10; i++) {
	var inst = instance_create_depth(x, y - 50, depth + 1, oUltimateSludge);
	inst.sludge_buff = BUFFTYPE.BURNRUSH;
	inst.sludge_sprite_fly = sUltNapalmFlame;
	inst.sludge_sprite_floor = sUltNapalmFlame;
	inst.owner = parent;
	inst.sludge_hsp *= val;
	inst.sludge_hsp += val * 2;
	val += 1/5;
}