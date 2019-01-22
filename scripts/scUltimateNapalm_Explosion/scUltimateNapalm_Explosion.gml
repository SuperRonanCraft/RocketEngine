for (var i = 0; i < 4; i++) {
	var inst = instance_create_depth(x, y - 5, depth + 1, oUltimateSludge);
	inst.sludge_buff = BUFFTYPE.BURNRUSH;
	inst.sprite_index = sUltNapalmFlame;
	inst.owner = parent;
	switch (i) {
		case 0: inst.sludge_hsp *= -0.5; break;
		case 1: inst.sludge_hsp *= -1; break;
		case 2: break;
		case 3: inst.sludge_hsp *= 0.5; break;
	}
}