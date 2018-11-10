/// @desc Draw the slider
draw_self();
draw_sprite_part(sprite_index, 1, 0, 0, sprite_width * value, sprite_height, x - (sprite_width / 2), y - sprite_get_yoffset(sprite_index));
draw_sprite(sSliderButton, 0, x + sprite_width * value - (sprite_width / 2), y);
//Title
scDrawSetupText(c_black, font, fa_middle, fa_bottom);
draw_text_transformed(x ,y , title, 1, 1, 0);
draw_set_color(c_white);
draw_text_transformed(x - 2, y - 2, title, 1, 1, 0);