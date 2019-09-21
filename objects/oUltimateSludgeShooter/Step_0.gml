
//Move with owner
if (owner != noone) {
	x = owner.x;
	y = owner.y;
}

//Shoot sludge every 5 steps with varying trajectories
if (timer % (5 * (room_speed / 30)) == 0 && amt < amtMax){
	//Create sludge object
	with (instance_create_depth(x + (10 * dir), bbox_top, depth + 1, oUltimateSludge)){
		owner = other.owner;
		sludge_hsp = (other.dir * (other.amt / 1.2)) + (other.dir * 12);
		sludge_vsp = (-other.amt / 1.2) - 2;
	}
	//Increase the amt
	amt++;
}

//The above basically functions like a for-loop in game-time.
timer++;

if (timer > maxtimer)
	instance_destroy();	