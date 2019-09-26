/*-----------------------------------------------------------------------------
Add Normals Shader: Adds normal sprites to a normal surface
Vertex Shader: Pass-through
-------------------------------------------------------------------------------
_______________________________________________________________________________
INFO:
-------------------------------------------------------------------------------
With this shader you can add normal sprites to normal surfaces so you can
use that surface in post processing like in distortion or lighting using the
vertex alpha to blend.

To make this work, the sprites need to be draw in blend mode (dest_col|src_col)

_______________________________________________________________________________
UNIFORMS:
-------------------------------------------------------------------------------
-
	
_______________________________________________________________________________
EXAMPLE:
-------------------------------------------------------------------------------
check demo file

*/
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main() {
	vec4 base_col	= texture2D(gm_BaseTexture, v_vTexcoord);
	base_col.rgb	= mix(vec3(0.5, 0.5, 1.0), base_col.rgb, v_vColour.a); 
	gl_FragColor	= vec4(base_col.rgb, 1.0);
}
