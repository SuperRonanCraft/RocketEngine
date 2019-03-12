if (first_step) exit;
first_step = true;

direction = !owner.shoot_face ? (owner.team == TEAM.LEFT ? 0 : 180) : (owner.facing == 1 ? 0 : 180); 