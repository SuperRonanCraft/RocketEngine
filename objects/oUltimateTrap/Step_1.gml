/// @desc 

if (first_step) exit;
first_step = true;

trap_hsp = (owner.team == TEAM.LEFT ? 1 : -1) * trap_hsp;
x += trap_hsp;