///@arg noise
///@arg height
function scGenerateColor(argument0, argument1) {

	var zz = argument0;
	var _h = argument1;
	var r = 0, g = 0, b = 0;

	if (_h < 3) {
		r = 150;
		g = 75;
	} else {
		r = 211;
		g = 211;
		b = 211;
	}

	/*var water_level = 30;

	if (zz < water_level)
		b = 50 + (zz / water_level) * 200;
	else
		g = 50 + ((zz - water_level) / (100 - water_level)) * 200;*/
	
	return make_color_rgb(r, g, b);


}
