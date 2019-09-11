//A whole map list of what a rocket has
//rocket_map = 0;
//Who shot this rocket
owner = noone;
//up-time
timer = 0;
//Size of explosion
//size = 1;
//Destroy variable for explosions
destroy = false;
deactivate = false;
//What this rocket has hit, add it to its explosion
hitList = ds_list_create();
confirmList = ds_list_create();

//Timing variables for first step and draw event
first_step = false;
first_draw = false;

//Target variable
target = noone;

image_xscale = 1.3;
image_yscale = 1.3;