/// scDrawPirPart(x, y, value, max, color, radius, transparency, width)
/// @arg x
/// @arg y
/// @arg value
/// @arg max
/// @arg color
/// @arg radius
/// @arg transparency
/// @arg width
/// @arg starting-angle*
function scDrawPiePart() {

	if (argument[2] == 0) exit;  // no point even running if there is nothing to display (also stops /0
	var len, tx, ty, val;
    
	var numberofsections = 60 // there is no draw_get_circle_precision() else I would use that here
	var sizeofsection = 360 / numberofsections
    
	val = (argument[2]/argument[3]) * numberofsections 
    
	if (val <= 1) exit; // HTML5 version doesnt like triangle with only 2 sides 
    
	var piesurface = surface_create(argument[5]*2,argument[5]*2);
            
	draw_set_colour(argument[4]);
	draw_set_alpha(argument[6]);
        
	surface_set_target(piesurface);
        
	draw_clear_alpha(c_blue, 0.7);
	draw_clear_alpha(c_black, 0);
        
	draw_primitive_begin(pr_trianglefan);
	draw_vertex(argument[5], argument[5]);
        
	for(var i = 0; i <= val; i++) {
		var _angle = argument_count > 8 ? (argument[8] != noone ? argument[8] : 90) : 90;
	    len = (i*sizeofsection) + _angle; // the 90 here is the starting angle
	    tx = lengthdir_x(argument[5], len);
	    ty = lengthdir_y(argument[5], len);
	    draw_vertex(argument[5] + tx, argument[5] + ty);
	}
        
	draw_primitive_end();
	draw_set_alpha(1);
	draw_set_colour(c_black);
	gpu_set_blendmode(bm_subtract);
	draw_circle(argument[5] - 1, argument[5] - 1, argument[5] - argument[7], false);
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
     
	draw_surface(piesurface,argument[0] - argument[5], argument[1] - argument[5]);
        
	surface_free(piesurface);


}
