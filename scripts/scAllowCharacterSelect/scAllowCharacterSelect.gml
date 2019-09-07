timer_enabled = false; //Character Select enables this
var amt = instance_number(oPlayer);
for (var i = 0; i < amt; i++) {
	with (instance_create_depth(0, 0, depth - 1, oUICharacterSelect)) {
		switch (amt) {
			case 2:
				switch (i) {
					case 0:
						start_x_default /= 2;
						break;
					case 1:
						start_x_default *= 1.5;
						break;
				}
				player = instance_find(oPlayer, i);
			default:
				break;
		}
	}
}