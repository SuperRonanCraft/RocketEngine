/// @desc 

if (is_undefined(other.rocket_map[? ROCKET_MAP.UNIQUE_CANBOUNCE])) exit;
if (jump_ani != 0) exit;

var type = other.rocket_map[? ROCKET_MAP.TYPE]

switch (type) {
	case ROCKET.BOUNCY:
		with (other) {
			var map = bounceMap;
			map[?"vsp"] = abs(map[?"vsp"]) * -2.5;	
			map[? "hsp"] *= 2;
		}
		break;
	case ROCKET.SPIKED:
		with (other) {
			if (direction < 90 && direction > -80)
				direction += 40;
			else if (direction > 90 && direction < 260)
				direction -= 40;
		}
		break;
}

jump_ani = jump_ani_max;