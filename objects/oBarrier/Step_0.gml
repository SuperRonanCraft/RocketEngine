/// @desc Move barrier
if (x != xstart)
	if (x > (xstart + x_max) || x < (xstart - ystart))
		hsp = -hsp;
if (y != ystart)
	if (y > (ystart + y_max) || y < (ystart - y_max))
		vsp = -vsp;
x += hsp;
y += vsp;