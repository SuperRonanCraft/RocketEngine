/// @desc follow owner

if (!global.play) exit; //If game is at play

x = owner.x;
y = owner.y;

//Collision
if (!instance_exists(oRocket)) exit;
var rlist = ds_list_create();
collision_circle_list(x, y, radius, oRocket, false, true, rlist, false); //Find all rocket instances in collision area
for (var i = 0; i < ds_list_size(rlist); i++) //Iterate through the rocket list
	with (ds_list_find_value(rlist, i)) //With the rocket instance
		if (owner != other.owner) {
			ds_list_add(hitList, other.owner);
			event_user(0); //Explode it
			scScreenShake(10, 30);
			instance_destroy(other); //Destroy the shield
			scPlaySound(SOUND.ULT_SHIELD_BREAK);
		}
ds_list_destroy(rlist);