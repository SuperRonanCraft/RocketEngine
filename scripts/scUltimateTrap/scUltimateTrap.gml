function scUltimateTrap() {
	for (var i = 0; i < 3; i++) {
		with (instance_create_depth(x, y, depth - 1, oUltimateTrap)) {
			owner = other;
			trap_hsp += (i * 5);
			trap_vsp += (-2 * i);
		}
	}


}
