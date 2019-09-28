if (first_step) exit;
first_step = true;

hsp *= owner.team != TEAM.NONE ? (owner.team == TEAM.LEFT ? 1 : -1) : (owner.facing == 1 ? 1 : -1); 