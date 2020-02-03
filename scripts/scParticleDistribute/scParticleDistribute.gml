///@arg x-min
///@arg x-max
///@arg y-min
///@arg y-max
///@arg particle
///@arg amount

var _xmin = argument[0];
var _xmax = argument[1];
var _ymin = argument[2];
var _ymax = argument[3];
var _part = argument[4];
var _amt = argument[5];

part_emitter_region(global.ParticleSystem1, global.Emitter1, _xmin, _xmax, _ymin, _ymax, ps_shape_ellipse, ps_distr_gaussian)
part_emitter_burst(global.ParticleSystem1, global.Emitter1, _part, _amt);