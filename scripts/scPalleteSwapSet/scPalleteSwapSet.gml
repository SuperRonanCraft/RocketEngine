/// @desc set the palette sprite and the index of the pallete to draw against
/// @param palette_sprite_index
/// @param palette_index
function scPalleteSwapSet(argument0, argument1) {

	var _pal_sprite = argument0;
	var _pal_index = argument1;

	if (_pal_index == 0 || _pal_sprite == noone) exit; //index 0 or no palette

	var mode = Pal_Shader_Type.Standard;

	shader_set(Pal_Shader);

	Pal_Shader_Is_Set=true;
	var tex = sprite_get_texture(_pal_sprite, 0);
	var UVs = sprite_get_uvs(_pal_sprite, 0);
    
	texture_set_stage(Pal_Texture[mode], tex);
	gpu_set_texfilter_ext(Pal_Texture[mode], true)
    
	var texel_x = texture_get_texel_width(tex);
	var texel_y = texture_get_texel_height(tex);
	var texel_hx = texel_x * 0.5;
	var texel_hy = texel_y * 0.5;
    
	shader_set_uniform_f(Pal_Texel_Size[mode], texel_x, texel_y);
	shader_set_uniform_f(Pal_UVs[mode], UVs[0] + texel_hx, UVs[1] + texel_hy, UVs[2], UVs[3]);
	shader_set_uniform_f(Pal_Index[mode], _pal_index);


}
