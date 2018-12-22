/// @desc change direction respection movement
/// @arg face-movement

//Change direction of xscale depending on where we're facing
if (argument0)
	if (canControl && hsp != 0 && hsp_move != 0)
		facing = sign(hsp);
	