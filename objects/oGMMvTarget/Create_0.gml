/// @desc Spawn targets config
diff = DIFFICULTY.EASY;
targets = 0;
targets_created = 0;
spawn_time = 60;

enum DIFFICULTY {
	EASY = 30, MEDIUM = 22, HARD = 15
}

//Score
gui_width = RES_W;
points_x = gui_width + 100;
points_y = 10;
points_x_target = gui_width - gui_width / 8;
points_speed = 15; //lower is faster
points_font = fPixel;
points_scale = 1;
points_itemheight = font_get_size(points_font);
points = 0;
points_current = points;
points_str_pre = "Score ";
points_str = points_str_pre + string(points);
points_top = points_y - (points_itemheight * 1.5);

//End game
lost_text = choose("You  Lost!", "Better  luck  next  time!", "Whoops!");

event_inherited();