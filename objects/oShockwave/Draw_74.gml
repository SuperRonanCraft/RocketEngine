/// @description MAIN

// just draw the application surface if the list of waves is empty.
// else draw the application surface distorted by the shader:

var wave_list_size = ds_list_size(list_of_waves);

if (wave_list_size <= 0) {
	draw_surface(application_surface, 0, 0);
} else {
	// set values based on sliders. In a game you'd use constants inside the shader instead
	var fx_strength	= 0.15 * 0.2 - 0.1; //Strength
	var aberration	= 0.35 * 2 - 1; //Distortion
	var subimage	= 2;
		
	// create waves surface:
	if (!surface_exists(srf_waves)) {
		srf_waves = surface_create(view_w * srf_waves_scale, view_h * srf_waves_scale);
		tex_waves = surface_get_texture(srf_waves);
	}
	
	gpu_set_texfilter(true);
	
	// draw wave sprite to waves surface:
	surface_set_target(srf_waves);
		draw_clear_alpha($FF7F7F, 1);
		gpu_set_blendmode_ext(bm_dest_color, bm_src_color);
		shader_set(shd_add_normals);
		
		var w, this_wave;
		//var wave_list_size = ds_list_size(list_of_waves);
		for (w = 0; w < wave_list_size; w++) {
			this_wave = list_of_waves[|w];
			draw_sprite_ext(sprite, subimage,
							(this_wave[|waveparam.xx] - camera_get_view_x(view_camera[0])) * srf_waves_scale,
							(this_wave[|waveparam.yy] - camera_get_view_y(view_camera[0])) * srf_waves_scale,
							this_wave[|waveparam.scale] * srf_waves_scale,
							this_wave[|waveparam.scale] * srf_waves_scale,
							0, c_white, this_wave[|waveparam.alpha]);
		}
		
		shader_reset();
		gpu_set_blendmode(bm_normal);
	surface_reset_target();
	
	// draw application surface with waves surface as 2nd texture:
	shader_set(shader);
		shader_set_uniform_f(u_fx_strength, fx_strength);
		shader_set_uniform_f(u_aspect, aspect);
		shader_set_uniform_f(u_aberration, aberration);
		texture_set_stage(u_tex_waves, tex_waves);
		draw_surface(application_surface, 0, 0);
	shader_reset();
	
	gpu_set_texfilter(false);
	
	// debug only: draw waves surface if toggle 0 in toggle group 1 is active:
	switch (0) {
		case 0: break;
		case 1: draw_surface_ext(srf_waves, 0, 0, 1 / srf_waves_scale, 1 / srf_waves_scale, 0, c_white, 0.8); break;
		case 2: draw_surface_ext(srf_waves, 0, 0, 1, 1, 0, c_white, 1);
	}
}

