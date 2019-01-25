/// @desc 
if (first_draw) exit;
first_draw = true;

direction = owner.team == TEAM.LEFT ? 0 : 180; //Side to point
var dir = owner.team == TEAM.LEFT ? 1 : -1;
light_speed *= dir;
light_speed *= dir;