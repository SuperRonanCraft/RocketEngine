/// @desc 
if (first_draw) exit;
first_draw = true;

direction = !owner.shoot_face ? (owner.team == TEAM.LEFT ? 0 : 180) : (owner.facing == 1 ? 0 : 180); //Side to point
var dir = direction == 0 ? 1 : -1;
light_speed *= dir;