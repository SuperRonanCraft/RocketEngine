/// @desc Initialize variables

//shuriken_map = 0;

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

//Sticky variables
stuckTo = noone;
newX = x;
newY = y;

//movement variables
debounce = false;
hsp = 0;
vsp = 0;

imgdir = irandom_range(0,359);
