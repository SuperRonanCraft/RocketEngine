/// @desc Reverse ultimate

//Amount of oPlayer instances
//var amt = instance_number(oPlayer);

//If player is not part of the team, give them the debuff
/*for (var i = 0; i < amt; i++) {
	var p = instance_find(oPlayer, i);
	if (p.team != team)
		scBuffAdd(BUFFTYPE.REVERSECONTROLS, p);
}*/

/*var dir = 0;
for (var i = 0; i < 6; i++) {
	//Set direction offset
	if (team == TEAM.LEFT)
		dir = 50 - (20 * i);
	else
		dir = 120 + (20 * i);
	//Create the rocket with the new direction
	with (scSpawnRocket(x, y, depth - 1, dir, id, rocket_map))
		rocket_map[? ROCKET_MAP.BUFF] = BUFFTYPE.REVERSECONTROLS;
}*/

var inst = instance_create_depth(x, y, depth, oPlayer);
with (inst) {
	keyleft = other.keyright;
	keyright = other.keyleft;
	keyjump = other.keyjump;
	keyshoot = noone;
	team = other.team;
	display = false;
	ult_enabled = false;
	hp = 1;
	hp_original = 1;
	despawn = true;
}