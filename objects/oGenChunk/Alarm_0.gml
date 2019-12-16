/// @desc Check to despawn
with (oPlayer) {
	//if ((x + CHUNK_SIZE / 2, y + CHUNK_SIZE / 2))
	if (abs((other.x + CHUNK_SIZE / 2) - x) > CHUNK_SIZE * 2)
		with (other)
			event_user(1); //Unload
	else
		other.alarm[0] = room_speed;
}