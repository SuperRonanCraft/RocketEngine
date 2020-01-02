//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform vec2 u_resolution;

void main()
{
	
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	gl_FragColor = vec4(gl_FragColor.r, gl_FragColor.g , gl_FragColor.b, gl_FragColor.a );
	
}
