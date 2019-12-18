/// @desc Check to despawn
with (pEntity) {
	if (abs((other.chunk_id[0]) - (x div CHUNK_SIZE)) > 2 || abs((other.chunk_id[1]) - (y div CHUNK_SIZE)) > 2) //Farther than 2 chunks away
		with (other) {
			event_user(1); //Unload
			exit;
		}
}

event_user(3); //Despawn/spawn walls
other.alarm[0] = room_speed;