/// @desc Achievements

achievementMap = ds_map_create();
scAchievementsLoad();

achievement_display = false;
achievement_display_list = ds_list_create();

ach_scale = 0.5;
ach_box_alpha = 0.3;
ach_speed = 5;
ach_alpha = 0.8;
ach_title = "New Achievement!";
ach_title_len = string_width(ach_title) * ach_scale;
ach_title_hei = string_height(ach_title) * ach_scale;
ach_display_time = 5 * room_speed;
ach_display_time_crt = ach_display_time;
ach_xstart = RES_W;
ach_ystart = 50;
ach_margin = 20;
ach_openning = true;
ach_pause_time = 2 * room_speed;
ach_pause_time_crt = ach_pause_time;
ach_x_crt = ach_xstart;