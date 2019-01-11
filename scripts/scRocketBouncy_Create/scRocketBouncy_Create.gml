/// @desc a sand rockets explosion create event
/// @arg explosion-instance

var val = 45 * (direction == 180 ? 1 : -1);
if (owner.standing)
	direction -= val;
else
	direction += val;
image_angle = direction;

bouncy = ds_map_create();
bouncy[? "reflectedx"] = false;
bouncy[? "reflectedy"] = false;
bouncy[? "passbarrier"] = true;