/// @desc Laser ultimate draw
/// @arg direction
function scUltimateLaser_Draw(argument0) {
	var width = 2;
	scDrawRect(x, y - width, argument0 == 0 ? room_width : 0, y + width, c_red, false, 0.5);


}
