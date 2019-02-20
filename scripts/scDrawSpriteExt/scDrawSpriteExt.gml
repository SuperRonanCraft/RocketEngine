/// @arg x
/// @arg y
/// @arg sprite
/// @arg img
/// @arg color
/// @arg alpha
/// @arg x-scale*
/// @arg y-scale*

var xx = argument[0], yy = argument[1], sprite = argument[2], img = argument[3];
var c = argument_count > 4 ? (argument[4] != noone ? argument[4] : c_white) : c_white;
var alpha = argument[5];
var xscale = argument_count > 6 ? (argument[6] != noone ? argument[6] : 1) : 1;
var yscale = argument_count > 7 ? (argument[7] != noone ? argument[7] : 1) : 1;

draw_sprite_ext(sprite, img, xx, yy, xscale, yscale, 0, c, alpha);