/// scDrawPieRect(x, y, value, max, color, radius, trans)
/// @arg x
/// @arg y
/// @arg value
/// @arg max
/// @arg color
/// @arg radius
/// @arg transparency

if (argument2 == 0) exit; 
var v, x1, y1, x2, y2, xm, ym, vd, vx, vy, vl;
v = argument2 / argument3;
if (v <= 0) return 0 // nothing to be drawn
x1 = argument0 - argument5; y1 = argument1 - argument5; // top-left corner
x2 = argument0 + argument5; y2 = argument1 + argument5; // bottom-right corner
if (v >= 1) return draw_rectangle(x1, y1, x2, y2, false) // entirely filled
xm = (x1 + x2) / 2; ym = (y1 + y2) / 2; // middle point
draw_primitive_begin(pr_trianglefan);
draw_set_alpha(argument6);
draw_set_color(argument4);
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