/// @desc

//Fade out
scDrawCircle(x, y, laser_width * (!growing ? (width_cur / laser_width): 1), c_aqua, false, 1);
//Draw laser to other enemy side
var width = (width_cur / 2) + (growing ? scMovementWave(2, -2, 1) : 0);
scDrawRect(x, y - width, x2, y + width, c_aqua, false, laser_alpha);

