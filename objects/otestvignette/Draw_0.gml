/// @description  

var uvs = sprite_get_uvs(sprite_index, 0);
var uv_w = uvs[2] - uvs[0];
var uv_h = uvs[3] - uvs[1];
uv_dimensions[0] = uv_w;
uv_dimensions[1] = uv_h;
uv_center[0] = 0.5 * uv_w + uvs[0];
uv_center[1] = 0.5 * uv_h + uvs[1];
shader_set_uniform_f_array(u_uv_center, uv_center);
shader_set_uniform_f_array(u_uv_dimensions, uv_dimensions);
shader_set(shslice);
shader_set(shslice);

draw_self();
shader_reset();
