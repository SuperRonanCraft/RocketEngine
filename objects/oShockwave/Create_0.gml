/// @description Init

//-----------------------------------------------------------------------------
//#region TITLE, INFO, CORNER, CLICK (optional):
//-----------------------------------------------------------------------------
/*title_text	= @"Shockwave Distortion
				multiple shockwaves
				with normal maps";

info_text	= @"Shockwave Distortion:

				This shader creates a shockwave effect on the application surface using normal maps.
				It can handle multiple shockwaves at once.
				The wave can also blur a bit or add some chromatic aberation.
				
				
				These are the steps needed:
				
				1. Control the waves:
				------------------------------------------------------------
				Each waves paramters are stored in a list and each of these lists IDs are stored in a list_of_waves.
				New waves are added when clicking the mouse and each wave is processed and eventually killed in step event.
				
				2. Draw the waves:
				------------------------------------------------------------
				Then all the wave sprites - which need to be normal maps - are drawn to a waves surface.
				We'll use blend modes and a shader to add them nicely.
				
				3. Distort the application surface:
				------------------------------------------------------------
				Finally we'll draw the application surface to the screen and use the waves surface to distort the application surface using another shader.";

corner_text	= "";			// if wanted/needed, update this in a step or draw event

click_region_gui	= true; // false: mouse click region in room space | true: mouse click region in gui space
deselectable		= false;	// Allow deselecting by clicking on the module again
#endregion*/
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
#region SPRITE & SHADER (mandatory):
//-----------------------------------------------------------------------------
sprite			= s_Shockwave; //_256

shader			= shShockwave;
u_fx_strength	= shader_get_uniform(shader, "fx_strength");
u_aspect		= shader_get_uniform(shader, "aspect");
u_aberration	= shader_get_uniform(shader, "aberration");
u_tex_waves		= shader_get_sampler_index(shader, "tex_waves");
aspect			= camera_get_view_width(view_camera[0]) / camera_get_view_height(view_camera[0]);
tex_waves		= -1;

// wave parameters:
wave_life		= 1 * game_get_speed(gamespeed_fps);	// life in seconds
//wave_scale_max	= (RES_W / 4) / sprite_get_width(sprite);		// size in pixels in room space
enum waveparam {xx, yy, age, scale, scale_max, alpha}				// should be in unreferenced script rather

// create waves list which will hold lists for each active wave.
// those lists will be created in step event on click
// and will age and be deleted in step event as well
list_of_waves	= ds_list_create();

// prepare waves surface
srf_waves		= -1;
srf_waves_scale	= 1/4;
//view_w			= camera_get_view_width(view_camera[0]);
//view_h			= camera_get_view_height(view_camera[0]);

// turn off automatic drawing of the application surface:
application_surface_draw_enable(false);
#endregion
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
//#region GUI
//-----------------------------------------------------------------------------

/*slider_set_caption(	0, "spd");
slider_set_value(	0, 0.70);

slider_set_caption(	1, "str");
slider_set_value(	1, 0.85);

slider_set_caption(	2, "abr");
slider_set_value(	2, 0.65);

toggle_set_caption(0, 0, "grid");
toggle_set_caption(1, 0, "srf: off");
toggle_set_caption(1, 1, "srf: full");
toggle_set_caption(1, 2, "srf: original");
toggle_set_caption(2, 0, "Sphere 1");
toggle_set_caption(2, 1, "Sphere 2");
toggle_set_caption(2, 2, "Ring 1");
toggle_set_caption(2, 3, "Ring 2");
toggle_set_caption(2, 4, "Saw");
toggle_set_caption(2, 5, "Flower");
toggle_set_caption(2, 6, "Diamond");
toggle_set_caption(2, 7, "Diamonds");
toggle_set_caption(2, 8, "Cube Ring");
toggle_set_caption(2, 9, "Meta Ring");
toggle_set_caption(3, 0, "info");

#endregion
//-----------------------------------------------------------------------------
*/
/*
var new_wave = ds_list_create();
new_wave[|waveparam.xx]		= x;
new_wave[|waveparam.yy]		= y;
new_wave[|waveparam.age]	= 0;
new_wave[|waveparam.scale]	= 0;
new_wave[|waveparam.alpha]	= 1;
ds_list_add(list_of_waves, new_wave);