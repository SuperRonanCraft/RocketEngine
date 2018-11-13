recoil = 0; //Amount of recoil to push the player back
damage = 1; //Damage count
projectile = -1; //Sprite to show
cooldown = 0; //Cooldown between shots
bulletspeed = 0; //Speed of rocket
offset = 10; //offset to spawn the rocket
startup = 0; //Delay between clicking the shoot key and launching
clip = -1; //How much 
ammo = clip;
reload_time = -1; //Reload time
specials = noone; //Special scripts
timer = -1; //Up-time
ignore_wall = false; //allow wall clipping
name = "default";

//Collision Checks
specialCollideWall = noone;
specialCollideRocket = noone;
specialCollideShootable = noone;