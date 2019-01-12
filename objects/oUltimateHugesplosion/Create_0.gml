/// @desc Sand Ultimate created!

//Owner of the ultimate
owner = noone;
side = TEAM.LEFT;
first_draw = false;
image_yscale = 1.3;
image_xscale = 1.3;

//Settings
explode_rocket_speed = 10;
explode_rocket_len = RES_W / 2;
explode_rocket_amount = 8;
explode_scale = 1.3;
explode_sprite = sexplosion_Default;
explode_rocket_particle = oParticleHandler.ds_part[? PARTICLES.SAND];
explode_rocket_particle_amt = 10;

traveled = 0;
exploding = false;
exploded = false;
spawned = false;
damage_list = ds_list_create();
damage = 2;