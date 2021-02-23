///@desc Initiates the palette system. Call once at the beginning of your game somewhere.
///@arg Shader
function scPalleteSwapStart() {

	globalvar Pal_Shader,Pal_Texel_Size, Pal_UVs, Pal_Index, Pal_Texture, Pal_Shader_Is_Set;
					
	enum Pal_Shader_Type { Standard }

	Pal_Shader = argument[0];

	Pal_Texel_Size[Pal_Shader_Type.Standard] = shader_get_uniform(Pal_Shader, "u_pixelSize");
	Pal_UVs[Pal_Shader_Type.Standard] = shader_get_uniform(Pal_Shader, "u_Uvs");
	Pal_Index[Pal_Shader_Type.Standard] = shader_get_uniform(Pal_Shader, "u_paletteId");
	Pal_Texture[Pal_Shader_Type.Standard] = shader_get_sampler_index(Pal_Shader, "u_palTexture");

	Pal_Shader_Is_Set = false;


}
