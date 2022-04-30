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
	
	/*
	float len = length((v_vTexcoord - uv_center) / uv_dimensions);
	float vignette = smoothstep(0.5, 0.1, len);
	
	base_col.rgb = mix(base_col.rgb, base_col.rgb*vignette, 0.71);
	*/
	
	
	base_col.r = v_vTexcoord.y/(uv_center.y + (uv_dimensions.y*0.5)); 
	gl_FragColor = base_col.rrrr;
	
}
