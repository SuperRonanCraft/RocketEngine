sand = ds_map_create();
var p = instance_furthest(x, y, oPlayer);
var turnspeed = 3;
if (p != noone) {
	var ydiff = y - p.y;
	if (ydiff < 0)
		turnspeed *= -1;;
}
ds_map_add(sand, "target", 45);
ds_map_add(sand, "target_current", 0);
ds_map_add(sand, "turnspeed", turnspeed);