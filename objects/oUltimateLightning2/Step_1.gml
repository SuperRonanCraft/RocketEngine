if (first_step) exit;
first_step = true;

direction = owner.team != TEAM.NONE ? (owner.team == TEAM.LEFT ? 0 : 180) : (owner.facing == 1 ? 0 : 180); 