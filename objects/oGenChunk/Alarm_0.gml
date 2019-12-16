/// @desc Check to despawn
with (oPlayer) {
	if (abs((other.chunk_id) - (x div CHUNK_SIZE)) > 2) //Farther than 2 chunks away
		with (other)
			event_user(1); //Unload
	else
		other.alarm[0] = room_speed;
}