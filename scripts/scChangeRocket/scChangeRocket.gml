/// @arg Weapon
weapon = argument0;
//All default values
scRocketsDefaults();
var wp_map = weapons[weapon];
if (ds_map_exists(wp_map, "recoil"))
	recoil = wp_map[? "recoil"]; //Amount of recoil to push the player back
if (ds_map_exists(wp_map, "damage"))
	damage = wp_map[? "damage"]; //Damage count
if (ds_map_exists(wp_map, "projectile"))
	projectile = wp_map[? "projectile"]; //Sprite to show
if (ds_map_exists(wp_map, "cooldown"))
	cooldown = wp_map[? "cooldown"]; //Cooldown between shots
if (ds_map_exists(wp_map, "bulletspeed"))
	bulletspeed = wp_map[? "bulletspeed"]; //Speed of rocket
if (ds_map_exists(wp_map, "offset"))
	offset = wp_map[? "offset"]; //offset to spawn the rocket
if (ds_map_exists(wp_map, "startup"))
	startup = wp_map[? "startup"]; //Delay between clicking the shoot key and launching
if (ds_map_exists(wp_map, "clip"))
	clip = wp_map[? "clip"]; //How much 
ammo = clip;
if (ds_map_exists(wp_map, "reload_time"))
	reload_time = wp_map[? "reload_time"]; //Reload time
if (ds_map_exists(wp_map, "specials"))
	specials = wp_map[? "specials"]; //special scripts
if (ds_map_exists(wp_map, "timer"))
	timer = wp_map[? "timer"]; //Up-time
if (ds_map_exists(wp_map, "ignore_wall"))
	ignore_wall = wp_map[? "ignore_wall"]; //allow wall clipping