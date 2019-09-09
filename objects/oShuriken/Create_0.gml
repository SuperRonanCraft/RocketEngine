/// @desc Initialize variables

shuriken_map = 0;

//owner of rocket

owner = noone;

//uptime
timer = 0;

//target variable (usually opponent)
target = noone;

//stuck to an object, deactivated
deactivate = false;

//What this weapon has hit, add it to its list
hitList = ds_list_create();
confirmList = ds_list_create();
