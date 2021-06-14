/// @desc Initialize variables

//shuriken_map = 0;

//owner of rocket

owner = noone;

//Loop animation
loop = true;

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
dmg = 0;
first_step = false;

rotate = false;
imgdir = irandom_range(0,359);

time_dialation = 1;