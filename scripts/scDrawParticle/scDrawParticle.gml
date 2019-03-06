/// @desc emit a particle
/// @arg x1
/// @arg y1
/// @arg x2
/// @arg y2
/// @arg particle-type
/// @arg particle-amt
/// @arg direction* [min, max]
/// @arg orientation* [min, max]
/// @arg scale* [x, y]
/// @arg spd* [min, max, inc]

var x1 = argument[0], y1 = argument[1], x2 = argument[2], y2 = argument[3];
var part = oParticleHandler.ds_part[? argument[4]], amt = argument[5];
var dir = argument_count > 6 ? argument[6] : noone;
var ori = argument_count > 7 ? argument[7] : noone;
var scale = argument_count > 8 ? argument[8] : noone;
var spd = argument_count > 9 ? argument[9] : noone;
if (dir != noone)
	part_type_direction(part, dir[0], dir[1], 0, 0);
if (ori != noone)
	part_type_orientation(part, ori[0], ori[1], 0, 0, false);
if (scale != noone)
	part_type_scale(part, scale[0], scale[1]);
if (spd != noone)
	part_type_speed(part, spd[0], spd[1], spd[2], 0);
part_emitter_region(global.ParticleSystem1, global.Emitter1, x1, x2, y1, y2, ps_shape_ellipse, ps_distr_gaussian);
//Then bursts with the defined particle over at oParticleHandler
part_emitter_burst(global.ParticleSystem1, global.Emitter1, part, amt);