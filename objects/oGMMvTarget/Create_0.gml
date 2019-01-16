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
points_itemheight = font_get_size(fPixel);
points = 0;
points_current = points;
points_str_pre = "Score ";
points_str = points_str_pre + string(points);
points_top = points_y - (points_itemheight * 1.5);

//End game
lost_text = choose("You  Lost!", "Better  luck  next  time!", "Whoops!");

event_inherited();

var time = 0;
switch (global.mode_1v1_timer) {
	case 0: time = 30; break;
	case 1: time = 60; break;
	case 2: time = 90; break;
	case 3: time = 180; break;
	case 4: time = 300; break;
}

timer = time; //New time
timer_current = timer;

var roc = ROCKET.DEFAULT;
for (var i = ROCKET.DEFAULT; roc < global.mode_targets_rockettype + ROCKET.DEFAULT && i < ROCKET.LENGHT; i++) {
	var list = scRocketGet(i);
	if (list[? ROCKET_MAP.ENABLED])
		roc++;
	ds_map_destroy(list);
}

with (oPlayer)
	scRocketChange(roc);