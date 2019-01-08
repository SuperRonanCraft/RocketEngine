/// @desc

scDrawCircle(x, y, laser_width, c_aqua, false, laser_alpha);

scDrawRect(x, y - (laser_width / 2), side == TEAM.LEFT ? RES_W : 0, y + (laser_width / 2), c_aqua, false, laser_alpha);