/// @desc Spawn targets config
var dif;
switch (global.mode_targets_difficulty) {
	case 0: dif = 30; break;
	case 1: dif = 15; break;
	case 2: dif = 7; break;
}
diff = dif;
targets = 0;
targets_created = 0;
spawn_time = 60;

//Score
gui_width = RES_W;
points_x = gui_width + 250;
points_y = 10;
points_x_target = gui_width - gui_width / 32;
points_speed = 15; //lower is faster
points_scale = 1;
//points_itemheight = font_get_size(fPixel);
points = 0;
points_current = points;
points_str_pre = "Score ";
points_str = points_str_pre + string(points);
//points_top = points_y - (points_itemheight * 1.5);

//End game
lost_text = choose("You Lost!", "Better luck next time!", "Whoops!");

event_inherited();
scAllowCharacterSelect(); //Character selector allowed

timer = scStageTimerStart(global.mode_targets_timer); //New time
timer_current = timer;

//MODIFIERS are now loaded in scPlayerLoadModifiers