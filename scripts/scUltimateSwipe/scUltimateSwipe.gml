/// @desc Swipe ultimate
var side = team != TEAM.LEFT; //true is left, right if false;
with (instance_create_layer(side ? RES_W : 0, 0, layer, oUltimateSwipe)) {
	swipe_side = !side;
	owner = other;
}