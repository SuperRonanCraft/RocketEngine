///@desc Draw a sprite in a nince splice box shape
///@arg sprite
///@arg x1
///@arg y1
///@arg x2
///@arg y2
///@arg alpha-sides
///@arg alpha-mid
function scDrawNineSplice() {

	var sprite = argument[0];
	var size = sprite_get_width(sprite) / 3;
	var x1 = argument[1];
	var y1 = argument[2];
	var x2 = argument[3];
	var y2 = argument[4];
	var w = x2 - x1;
	var h = y2 - y1;
	var c = w div size; //Columns
	var r = h div size; //Rows
	var alpha = argument[5];
	var alpha_mid = argument[6];

	draw_set_alpha(alpha);
	//CORNERS
	 //left
	draw_sprite_part(sprite, 0, 0, 0, size, size, x1, y1);
	 //right
	draw_sprite_part(sprite, 0, size * 2, 0, size, size, x1 + (c * size), y1);
	 //left - bottom
	draw_sprite_part(sprite, 0, 0, size * 2, size, size, x1, y1 + (r * size));
	 //right - bottom
	draw_sprite_part(sprite, 0, size * 2, size * 2, size, size, x1 + (c * size), y1 + (r * size));

	//EDGES
	for (var i = 1; i < r; i++) {
		//left
		draw_sprite_part(sprite, 0, 0, size, size, size, x1, y1 + (i * size));
		//right
		draw_sprite_part(sprite, 0, size * 2, size, size, size, x1 + (c * size), y1 + (i * size));
	}

	for (var i = 1; i < c; i++) {
		//top
		draw_sprite_part(sprite, 0, size, 0, size, size, x1 + (i * size), y1);
		//bottom
		draw_sprite_part(sprite, 0, size, size * 2, size, size, x1 + (i * size), y1 + (r * size));
	}

	//MIDDLE
	//draw_set_alpha(alpha_mid);
	draw_sprite_part_ext(sprite, 0, size, size, size, size, x1 + size, y1 + size, c - 1, r - 1, c_white, alpha_mid);
	/*
	for (var i = 1; i < c; i++)
		for (var j = 1; j < r; j++)
			draw_sprite_part(sprite, 0, size, size, size, size, x1 + (i * size), y1 + (j * size));*/
	draw_set_alpha(1);

	return [c * size + size, r * size + size]; //Return how wide and how tall we are


}
