/// @desc Draw the slider
draw_sprite(sprite, 0, x, y);
draw_sprite_part(sprite, 1, 0, 0, width * value, height, x - (width / 2), y - sprite_get_yoffset(sprite));
draw_sprite(sSliderButton, 0, x + width * value - (width / 2), y);
//Title
//scDrawSetupText(c_black, font, fa_middle, fa_bottom);
draw_text_transformed(x ,y , title, 1, 1, 0);
draw_set_color(c_white);
draw_text_transformed(x - 2, y - 2, title, 1, 1, 0);