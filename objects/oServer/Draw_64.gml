/// @description  Display connected players, and number of baddies left.
draw_set_halign(fa_left);
draw_set_font(fPixel);
draw_set_color(c_red);

draw_text(10, 10,"players: " + string(global.PlayerTotal));
draw_text(10, 30,"enemies: " + string(global.BaddieCount));

