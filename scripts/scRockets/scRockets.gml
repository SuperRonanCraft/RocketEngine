/// @desc Load all rockets and set the default rocket
/// @arg default-rocket

weapons[0] = ds_map_create();
//Unarmed
ds_map_add(weapons[0], "recoil", 0);
ds_map_add(weapons[0], "damage", 0);
ds_map_add(weapons[0], "projectile", -1);
ds_map_add(weapons[0], "cooldown", 0);
ds_map_add(weapons[0], "startup", 0);
ds_map_add(weapons[0], "bulletspeed", 0);
ds_map_add(weapons[0], "offset", 0);
ds_map_add(weapons[0], "clip", -1);
ds_map_add(weapons[0], "reload_time", -1);
ds_map_add(weapons[0], "aimbot", false);
ds_map_add(weapons[0], "timer", -1);

//DEFAULT
weapons[1] = ds_map_create();
ds_map_add(weapons[1], "recoil", 2);
ds_map_add(weapons[1], "damage", 1);
ds_map_add(weapons[1], "projectile", sRocket_Default);
ds_map_add(weapons[1], "cooldown", 20);
ds_map_add(weapons[1], "startup", 0);
ds_map_add(weapons[1], "bulletspeed", 10);
ds_map_add(weapons[1], "offset", 10);
ds_map_add(weapons[1], "clip", -1);
ds_map_add(weapons[1], "reload_time", -1);
ds_map_add(weapons[0], "aimbot", false);
ds_map_add(weapons[1], "timer", -1);

//FAST
weapons[2] = ds_map_create();
ds_map_add(weapons[2], "recoil", 3);
ds_map_add(weapons[2], "damage", 1);
ds_map_add(weapons[2], "projectile", sRocket_Fast);
ds_map_add(weapons[2], "cooldown", 25);
ds_map_add(weapons[2], "startup", 0);
ds_map_add(weapons[2], "bulletspeed", 25);
ds_map_add(weapons[2], "offset", 10);
ds_map_add(weapons[2], "clip", -1);
ds_map_add(weapons[2], "reload_time", -1);
ds_map_add(weapons[2], "aimbot", false);
ds_map_add(weapons[2], "timer", 6);

//HOMING
weapons[3] = ds_map_create();
ds_map_add(weapons[3], "recoil", 5);
ds_map_add(weapons[3], "damage", 2);
ds_map_add(weapons[3], "projectile", sRocket_Fast);
ds_map_add(weapons[3], "cooldown", 30);
ds_map_add(weapons[3], "startup", 0);
ds_map_add(weapons[3], "bulletspeed", 5);
ds_map_add(weapons[3], "offset", 10);
ds_map_add(weapons[3], "clip", -1);
ds_map_add(weapons[3], "reload_time", -1);
ds_map_add(weapons[3], "aimbot", true);
ds_map_add(weapons[3], "timer", 6);

enum ROCKET {
	NONE = 0, DEFAULT = 1, FAST = 2, HOMING = 3
}

scChangeRocket(argument0);

current_cd = 0;
current_delay = -1;
current_recoil = 0;
current_reload = 0;