/// scDrawPie(x ,y ,value ,max ,color ,radius ,transparency)
/// @arg x
/// @arg y
/// @arg value
/// @arg max
/// @arg color
/// @arg radius
/// @arg transparency
function scDrawPie(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {

	if (argument2 > 0) { // no point even running if there is nothing to display (also stops /0
	    var len, tx, ty, val;
	    var numberofsections = 60 // there is no draw_get_circle_precision() else I would use that here
	    var sizeofsection = 360 / numberofsections
	    val = (argument2 / argument3) * numberofsections 
	    if (val > 1) { // HTML5 version doesnt like triangle with only 2 sides
	        draw_set_colour(argument4);
	        draw_set_alpha(argument6);
	        draw_primitive_begin(pr_trianglefan);
	        draw_vertex(argument0, argument1);
        
	        for (var i = 0; i <= val; i++) {
	            len = (i * sizeofsection) + 90; // the 90 here is the starting angle
	            tx = lengthdir_x(argument5, len);
	            ty = lengthdir_y(argument5, len);
	            draw_vertex(argument0 + tx, argument1 + ty);
	        }
	        draw_primitive_end();
	    }
	    draw_set_alpha(1);
	}


}
