/// @desc
event_inherited();

with (oPlayer) {
	other.player_hp = shootable_map[? SHOOTABLE_MAP.HEALTH];
	//other.player_rocket = rocket_map[? ROCKET_MAP.TYPE];
}