/// @desc Move barrier
var sp = spd / TIME_SPEED;
if ((bbox_bottom >= RES_H && sp == abs(sp)) || (bbox_top <= 0 && sign(sp) == -1))
	spd = -spd;
y += sp;