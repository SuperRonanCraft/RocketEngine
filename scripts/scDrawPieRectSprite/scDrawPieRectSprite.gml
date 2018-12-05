/// scDrawPirPart(x, y, value, max, color, radius, transparency, width)
/// @arg x
/// @arg y
/// @arg value
/// @arg max
/// @arg color
/// @arg radius
/// @arg transparency
/// @arg sprite

if (argument2 == 0 || argument2 / argument3 == 0) exit; // no point even running if there is nothing to display (also stops /0
var v, x1, y1, x2, y2, xm, ym, vd, vx, vy, vl;

v = argument2 / argument3;

if (v >= 1) {draw_sprite(argument7, 0, argument0, argument1); exit;}// entirely filled
x1 = argument0 - argument5; y1 = argument1 - argument5; // top-left corner
x2 = argument0 + argument5; y2 = argument1 + argument5; // bottom-right corner

//Surface to draw to
var piesurface = surface_create(argument5*2,argument5*2);       
draw_set_colour(argument4);
draw_set_alpha(argument6);    
surface_set_target(piesurface);

draw_set_color(c_white);
draw_sprite(argument7, 0, argument0, argument1);
gpu_set_blendmode(bm_subtract);
xm = (x1 + x2) / 2; ym = (y1 + y2) / 2; // middle point
draw_primitive_begin(pr_trianglefan);
draw_vertex(xm, ym); draw_vertex(xm, y1);
// draw corners:
if (v >= 0.125) draw_vertex(x2, y1);
if (v >= 0.375) draw_vertex(x2, y2);
if (v >= 0.625) draw_vertex(x1, y2);
if (v >= 0.875) draw_vertex(x1, y1);
// calculate angle & vector from value:
vd = pi * (v * 2 - 0.5);
vx = cos(vd);
vy = sin(vd);
// normalize the vector, so it hits -1+1 at either side:
vl = max(abs(vx), abs(vy));
if (vl < 1) {
    vx /= vl;
    vy /= vl;
}
draw_vertex(xm + vx * (x2 - x1) / 2, ym + vy * (y2 - y1) / 2);
draw_set_alpha(1);
draw_primitive_end();
gpu_set_blendmode(bm_normal);
surface_reset_target();
     
draw_surface(piesurface, argument0 - argument5, argument1 - argument5);
        
surface_free(piesurface);