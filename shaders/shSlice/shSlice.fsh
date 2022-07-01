 //
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec2 v_vPosition; 
varying vec4 v_vColour;

uniform vec2 uv_center;
uniform vec2 uv_dimensions;
uniform float u_angle;

void main()
{
	vec4 base_col = texture2D(gm_BaseTexture, v_vTexcoord);
	
	
	 
	gl_FragColor.a = base_col.r;
	
}
