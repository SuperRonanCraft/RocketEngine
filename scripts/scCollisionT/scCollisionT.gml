/// @desc Tile Collision

//vsp += grv;
var bbox_side;
var tilemap = global.tilemap;
var grounded = true;
var height = sprite_height;

//Horizontal
if (hsp > 0)
	bbox_side = bbox_right;
else
	bbox_side = bbox_left;
if (tilemap_get_at_pixel(tilemap, bbox_side + hsp, bbox_bottom) != 0 || tilemap_get_at_pixel(tilemap, bbox_side + hsp, bbox_top) != 0) {
	if (hsp > 0)
		x = x - (x mod height) + (height - 1) - (bbox_right - x);
	else 
		x = x - (x mod height) - (bbox_left - x);
	hsp = 0;
}

//Vertical
if (vsp > 0)
	bbox_side = bbox_bottom;
else
	bbox_side = bbox_top;
if (tilemap_get_at_pixel(tilemap, bbox_right, bbox_side + vsp) != 0 || tilemap_get_at_pixel(tilemap, bbox_left, bbox_side + vsp) != 0) {
	if (vsp > 0) {
		y = y - (y mod height) + (height - 1) - (bbox_bottom - y);
		standing = true;
	} else
		y = y - (y mod height) - (bbox_top - y);
	vsp = 0;
} else
	//Not on tile
	grounded = false;

return grounded;