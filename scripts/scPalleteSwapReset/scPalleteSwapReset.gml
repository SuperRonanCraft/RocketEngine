///@desc Resets the shader
function scPalleteSwapReset() {

	if (Pal_Shader_Is_Set)
		shader_reset();
	Pal_Shader_Is_Set = false;


}
