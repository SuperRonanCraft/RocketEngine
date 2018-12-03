/// @desc gamemode stage selection draw gui event

//Current gamemode text
draw_set_halign(fa_middle);
draw_set_valign(fa_middle);
var text = global.gamemode;
//var len = string_length(text) * (2 * 10);
var xx = RES_W / 2;
var yy = RES_H / 4;
scDrawText(xx, yy, text, c_gray, 2);
//draw_line_width_color(xx - len, yy + 50, xx + len, yy + 50, 2, c_black, c_black);

//Stage ID text
text = string(stage_on + 1);
xx = RES_W / 2;
yy = RES_H / 4 + RES_H / 2 - 25;
scDrawText(xx, yy, text, c_yellow, 1.5);