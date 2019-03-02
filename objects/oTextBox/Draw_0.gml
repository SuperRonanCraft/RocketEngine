/// @description  Draw the text box and caption

draw_self();

draw_set_halign(fa_left);
draw_set_color(c_black);
draw_set_font(fPixel);

draw_text(x + 8, y + 7, string(text));
draw_text(x + 8, y - 23, ("Player Name"));


