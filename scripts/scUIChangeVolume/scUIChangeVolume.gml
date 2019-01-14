/// @arg volume
/// @arg type (0 = master, 1 = effects, 2 = music)

var type = argument1;
switch (type) {
	case 0: audio_master_gain(argument0); break;
	case 1: audio_group_set_gain(agEffects, argument0, 0); break;
	case 2: audio_group_set_gain(agMusic, argument0, 0); break;
}