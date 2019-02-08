/// @desc
event_inherited();

with (oPlayer) {
	other.player_hp = hp;
	other.player_rocket = rocket_map[? ROCKET_MAP.TYPE];
}