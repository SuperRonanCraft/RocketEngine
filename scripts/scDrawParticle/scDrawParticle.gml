/// @desc emit a particle
/// @arg x1
/// @arg y1
/// @arg x2
/// @arg y2
/// @arg particle-type
/// @arg patiicle-amt
/// @arg direction* [min, max]

var x1 = argument[0], y1 = argument[1], x2 = argument[2], y2 = argument[3];
var part = oParticleHandler.ds_part[? argument[4]], amt = argument[5];
var dir = argument_count > 6 ? argument[6] : noone;
if (dir != noone)
	part_type_direction(part, dir[0], dir[1], 0, 0);
part_emitter_region(global.ParticleSystem1, global.Emitter1, x1, x2, y1, y2, ps_shape_ellipse, ps_distr_gaussian);
//Then bursts with the defined particle over at oParticleHandler
part_emitter_burst(global.ParticleSystem1, global.Emitter1, part, amt);