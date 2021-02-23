/// @desc 

if (other.owner != owner)
	with (other) {
		ds_list_add(hitList, other.owner); //Disable the rockets damage to that player
		event_user(0); //Explode it
		scScreenShake(10, 30);
		instance_destroy(other); //Destroy the shield
		scPlaySound(SOUND.ULT_SHIELD_BREAK, noone, [SOUND.ULT_SHIELD_CAST]);
	}