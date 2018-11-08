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

//DEFAULT
weapons[1] = ds_map_create();
ds_map_add(weapons[1], "recoil", 20);
ds_map_add(weapons[1], "damage", 1);
ds_map_add(weapons[1], "projectile", sRocket_Default);
ds_map_add(weapons[1], "cooldown", 20);
ds_map_add(weapons[1], "startup", 0);
ds_map_add(weapons[1], "bulletspeed", 20);
ds_map_add(weapons[1], "length", 60);
ds_map_add(weapons[1], "clip", 1);
ds_map_add(weapons[1], "reload_time", 120);

scChangeRocket(1);

current_cd = 0;
current_delay = -1;
current_recoil = 0;
current_reload = 0;

//Owner of the weapon
owner = noone;