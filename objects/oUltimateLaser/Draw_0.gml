/// @desc

//Fade out
var offset = growing ? scMovementWave(2, -2, 1) : 0;
scDrawCircle(x, y, (laser_width * (!growing ? (width_cur / laser_width): 1)) + offset, c_aqua, false, 1);
//Draw laser to other enemy side
var width = (width_cur / 2) + offset;
scDrawRect(x, y - width, x2, y + width, c_aqua, false, laser_alpha);

