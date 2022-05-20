/// @description
depth = -500;
/*
draw_set_alpha(0.3);
for(var j = 0; j < ds_grid_height(dsGrid); j++) {
	for (var i = 0; i < ds_grid_width(dsGrid); i++) {
	
		var colored = c_red;
	
		if(dsGrid[# i,j] == 0)
			colored = c_lime;
		else if(dsGrid[# i,j] == 1)
			colored = c_yellow;
	
	    draw_rectangle_color(i*BLOCK_SIZE,j*BLOCK_SIZE,(i*BLOCK_SIZE)+BLOCK_SIZE, (j*BLOCK_SIZE)+BLOCK_SIZE, colored,colored,colored,colored, false );
		//draw_text((i*BLOCK_SIZE)+BLOCK_SIZE*.5,(j*BLOCK_SIZE)+BLOCK_SIZE*.5, dsGrid[# i,j]);
	}
}
draw_set_alpha(1);

//draw_text(mouse_x,mouse_y, "X: " + string(mouse_x) + " X%:" + string(mouse_x div BLOCK_SIZE));

