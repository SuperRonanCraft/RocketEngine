/// @desc 

if (first_draw) exit;

first_draw = true;

direction = owner.team == TEAM.LEFT ? 0 : 180;
image_xscale *= owner.team == TEAM.LEFT ? 1 : -1;
rocket_map = owner.rocket_map;