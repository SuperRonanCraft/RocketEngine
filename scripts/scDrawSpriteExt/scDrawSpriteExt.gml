/// @arg x
/// @arg y
/// @arg sprite
/// @arg img
/// @arg color*
/// @arg alpha*
/// @arg x-scale*
/// @arg y-scale*
/// @arg rot*

var xx = argument[0], yy = argument[1], sprite = argument[2], img = argument[3];
var c = argument_count > 4 ? (argument[4] != noone ? argument[4] : c_white) : c_white;
var alpha = argument_count > 5 ? (argument[5] != noone ? argument[5] : 1) : 1;
var xscale = argument_count > 6 ? (argument[6] != noone ? argument[6] : 1) : 1;
var yscale = argument_count > 7 ? (argument[7] != noone ? argument[7] : 1) : 1;
var rot = argument_count > 8 ? (argument[8] != noone ? argument[8] : 0) : 0;

draw_sprite_ext(sprite, img, xx, yy, xscale, yscale, rot, c, alpha);