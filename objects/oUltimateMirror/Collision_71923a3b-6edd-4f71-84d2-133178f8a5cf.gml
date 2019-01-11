/// @desc 

if (other.owner != owner) //Is not your rocket
	with (other) {
		//if (target != noone)
		//	target = owner;
		owner = other.owner; //Change the owner
		direction = direction + 180; //Flip the rocket
		image_angle = direction;
	}