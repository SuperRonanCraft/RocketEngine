/// @desc 
with (oPlayer) //Dont allow players to bug out :D
	if (x > RES_W || x < 0 || y > RES_H || y < 0) {
		x = xstart;
		y = ystart;
	}
event_inherited();

