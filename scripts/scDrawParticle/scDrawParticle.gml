/// @desc emit a particle
/// @arg x1
/// @arg y1
/// @arg x2
/// @arg y2
/// @arg particle-type
/// @arg patiicle-amt

var x1 = argument0, y1 = argument1, x2 = argument2, y2 = argument3;
var part = oParticleHandler.ds_part[? argument4], amt = argument5;
part_emitter_region(global.ParticleSystem1, global.Emitter1, x1, x2, y1, y2, ps_shape_ellipse, ps_distr_gaussian);
//Then bursts with the defined particle over at oParticleHandler
part_emitter_burst(global.ParticleSystem1, global.Emitter1, part, amt);