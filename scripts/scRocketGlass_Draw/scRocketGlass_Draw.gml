function scRocketGlass_Draw() {

	if(!variable_instance_exists(id, "miss")){
		draw_self();	
	}

	else{
		if(miss)
			draw_line_width_color(owner.x,owner.y,lineEnd,owner.y,4,c_white,c_white);
	
		else
			draw_line_width_color(owner.x,owner.y,lineEnd,owner.y,4,c_yellow,c_yellow);
	}	
	
	


}
