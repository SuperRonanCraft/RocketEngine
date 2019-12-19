/// @desc Initialize variables

//shuriken_map = 0;

//owner of weapon

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
touching = ds_list_create();

//Sticky variables
flyWith = noone;
stuckTo = noone;
newX = x;
newY = y;
newAngle = 0;

//movement variables
debounce = false;
hsp = 0;
vsp = 0;
grv_dir = 1;

fullPower = false;
kb = 0;
spd = 0;
dmg = 0;
rotate = false;
imgdir = irandom_range(0,359);
facing = 1;

time_dialation = 1;
