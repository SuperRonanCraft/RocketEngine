/// @desc Move barrier
if (x != x_original)
	if (x > (x_original + x_max) || x < (x_original - y_max))
		hsp = -hsp;
if (y != y_original)
	if (y > (y_original + y_max) || y < (y_original - y_max))
		vsp = -vsp;
x += hsp;
y += vsp;