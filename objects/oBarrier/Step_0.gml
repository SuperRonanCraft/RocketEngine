/// @desc Move barrier
if ((bbox_bottom >= RES_H && spd == abs(spd)) || (bbox_top <= 0 && sign(spd) == -1))
	spd = -spd;
y += spd;