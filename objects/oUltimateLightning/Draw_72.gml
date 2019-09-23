/// @desc 
if (first_draw) exit;
first_draw = true;

direction = owner.team != TEAM.NONE ? (owner.team == TEAM.LEFT ? 0 : 180) : (owner.facing == 1 ? 0 : 180); //Side to point