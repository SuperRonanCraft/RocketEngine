/// @desc Trigger checkpoint

with (oGMMSingle) {
	if (player_checkpoint < other.order_id) {
		player_checkpoint = other.order_id;
		other.triggered = true;
	}
}
