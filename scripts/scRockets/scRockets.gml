/// @desc Load all rockets and set the default rocket
/// @arg default-rocket

//UNARMED
weapons[0] = ds_map_create();
ds_map_add(weapons[0], "damage", 0);

//DEFAULT
weapons[1] = ds_map_create();
ds_map_add(weapons[1], "recoil", 2);
ds_map_add(weapons[1], "projectile", sRocket_Default);
ds_map_add(weapons[1], "cooldown", 20);
ds_map_add(weapons[1], "bulletspeed", 10);

//FAST
weapons[2] = ds_map_create();
ds_map_add(weapons[2], "recoil", 3);
ds_map_add(weapons[2], "projectile", sRocket_Fast);
ds_map_add(weapons[2], "cooldown", 5);
ds_map_add(weapons[2], "bulletspeed", 22);
ds_map_add(weapons[2], "clip", 5);
ds_map_add(weapons[2], "reload_time", 60);

//HOMING
weapons[3] = ds_map_create();
ds_map_add(weapons[3], "recoil", 5);
ds_map_add(weapons[3], "damage", 2);
ds_map_add(weapons[3], "projectile", sRocket_Homing);
ds_map_add(weapons[3], "cooldown", 60);
ds_map_add(weapons[3], "bulletspeed", 5);
ds_map_add(weapons[3], "timer", 120);
ds_map_add(weapons[3], "specials", scRocketSpecialHoming);
ds_map_add(weapons[3], "ignore_wall", true);

//REVERSE
weapons[4] = ds_map_create();
ds_map_add(weapons[4], "recoil", 5);
ds_map_add(weapons[4], "projectile", sRocket_Reverse);
ds_map_add(weapons[4], "cooldown", 40);
ds_map_add(weapons[4], "bulletspeed", 5);
ds_map_add(weapons[4], "offset", 10);
ds_map_add(weapons[4], "timer", 180);
ds_map_add(weapons[4], "specials", scRocketSpecialReverse);
ds_map_add(weapons[4], "ignore_wall", true);

//ICE
weapons[5] = ds_map_create();
ds_map_add(weapons[5], "name", "Ice Rocket");
ds_map_add(weapons[5], "recoil", 5);
ds_map_add(weapons[5], "projectile", sRocket_Ice);
ds_map_add(weapons[5], "cooldown", 40);
ds_map_add(weapons[5], "bulletspeed", 10);
ds_map_add(weapons[5], "timer", 180);
ds_map_add(weapons[5], "specials", scRocketSpecialIce);
ds_map_add(weapons[5], "specialCollideRocket", scRocketSpecialIce_Rocket);
ds_map_add(weapons[5], "specialCollideWall",scRocketSpecialIce_Wall);
ds_map_add(weapons[5], "specialCollideShootable", scRocketSpecialIce_Shootable);

enum ROCKET {
	NONE = 0, DEFAULT = 1, FAST = 2, HOMING = 3, REVERSE = 4, ICE = 5
}

//Rocket progress
current_cd = 0;
current_delay = -1;
current_recoil = 0;
current_reload = 0;
rockets = 0;

//Setup the default rocket type
scChangeRocket(argument0);