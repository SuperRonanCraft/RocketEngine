

//All lines tagged with a '*' are MUST HAVE.


var map = ds_map_create();

map[? SHURIKEN_MAP.PROJECTILE] = SHURIKEN_SPRITE.NONE; //Sprite to showw
map[? SHURIKEN_MAP.NAME] = "default"; //Name of weapon*
map[? SHURIKEN_MAP.DESCRIPTION] = "Hidden like a ninja."; //Description of weapon*
map[? SHURIKEN_MAP.SPEED] = 0; //speed of weapon
map[? SHURIKEN_MAP.STICK] = true; //allow wall stick
map[? SHURIKEN_MAP.TYPE] = SHURIKEN.NONE;//weapon type*
map[? SHURIKEN_MAP.COOLDOWN] = 0; //cooldown between shots
map[? SHURIKEN_MAP.DAMAGE] = 1; //base damage
map[? SHURIKEN_MAP.RELOAD_TIME] = -1;
map[? SHURIKEN_MAP.TIMER] = 75; //uptime
map[? SHURIKEN_MAP.CLIP] = -1; //ammo in a clip
map[? SHURIKEN_MAP.STARTUP] = 0; //delay between pressing key and shooting
map[? SHURIKEN_MAP.SCALE] = 1; //size of sprite
map[? SHURIKEN_MAP.SHURIKEN_AUTO_DESTROY] = false; //auto destroy on collision
map[? SHURIKEN_MAP.SHURIKEN_AUTO_DESTROY_ROOM] = true; //auto destroy when out of room
map[? SHURIKEN_MAP.SHURIKEN_STEP] = noone; //script to override step (including movement)
map[? SHURIKEN_MAP.BUFF] = noone;
map[? SHURIKEN_MAP.DEATHCAUSE] = noone;
map[? SHURIKEN_MAP.KBAMT] = 0;

map[? SHURIKEN_MAP.ULTIMATE] = ULTIMATE.DEFAULT;//weapon's ultimate ability
map[? SHURIKEN_MAP.ULTIMATE_CHARGE_GIVE] = true; //if weapon gives ult charge
map[? SHURIKEN_MAP.ULTIMATE_CHARGE_MULTIPLIER] = 1; //multiplier of charge rate

return map;