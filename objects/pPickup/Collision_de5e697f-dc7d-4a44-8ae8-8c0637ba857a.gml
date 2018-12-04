/// @desc collision with player
if (destroy)
	instance_destroy();
//Pickup sound
scPlaySound(SOUND.EFFECT_PICKUP);
depth += 50;