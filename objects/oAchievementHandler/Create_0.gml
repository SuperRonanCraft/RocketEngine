/// @desc Achievements

alarm_set(0, room_speed * 10); //Start schievement listener
achieve_map = ds_map_create();
scAchievementsLoad();

achievement_display = false;
achievement_display_list = ds_list_create();

ach_scale = 0.5;
ach_scale_desc = 0.3;
ach_box_alpha = 0.6;
ach_speed = 5;
ach_alpha = 0.8;
ach_title = "New Achievement!";
ach_title_len = string_width(ach_title) * ach_scale;
ach_title_hei = string_height(ach_title) * ach_scale;
ach_xstart = RES_W / 2;
ach_ystart = 0;
ach_margin = 20;
ach_openning = true;
ach_pause_time = 3 * room_speed;
ach_pause_time_crt = ach_pause_time;
ach_height = 64 + ach_margin;
ach_y_crt = -ach_height;
ach_playedsound = false;