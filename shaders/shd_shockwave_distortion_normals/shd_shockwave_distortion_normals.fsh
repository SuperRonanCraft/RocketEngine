/*-----------------------------------------------------------------------------
Shockwave Shader: Creates a shockwave across the application surface
Vertex Shader: Pass-through
-------------------------------------------------------------------------------
_______________________________________________________________________________
INFO:
-------------------------------------------------------------------------------
This shader creates a shockwave across the application surface by drawing
scaled normal map sprites to a surface and using that surface as a distortion
map.

This means you need to turn off the autoamtic drawing of the application 
surface and draw it manually i.e. in Draw GUI Begin or Post Draw event.

This shader can handle multiple shockwaves at a time.

It also adds a blud or aberration effect if wanted.

_______________________________________________________________________________
UNIFORMS:
-------------------------------------------------------------------------------
uniform float		fx_strength	0:	no effect
								>0:	the larger the number the more distortion
								<0: as >0 but flipped distortion direction
								usually -1 to +1 is ok
uniform float		aberration	0 <= aberration < 1
								size of the blur or chromatic aberration effect
								0: no effect
								>=abs(1): gets messy
uniform sampler2D	tex_waves	the sampler id of the waves surface
	
_______________________________________________________________________________
EXAMPLE:
-------------------------------------------------------------------------------
check demo file
*/

varying vec2		v_vTexcoord;

uniform float		fx_strength;
uniform float		aspect;
uniform float		aberration;
uniform sampler2D	tex_waves;

#define BORDER_COL vec3(0.2, 0.25, 0.3)


void main() {
	// --------------------------------------------------------------------
	// OFFSET FROM NORMAL
	// --------------------------------------------------------------------
	vec2 offset	= (texture2D( tex_waves, v_vTexcoord ).rg - 0.5) * 2.0 * fx_strength;
	offset.x	/= aspect;
	
	
	// --------------------------------------------------------------------
	// COLOUR VERSIONS
	// --------------------------------------------------------------------
	vec4 out_col;
	
	// v1: Plain:----------------------------------------------------------
	//out_col			=	texture2D(gm_BaseTexture, v_vTexcoord + offset);
	
	// v2: Simple Blur:----------------------------------------------------
	/*out_col			=	(texture2D(gm_BaseTexture, v_vTexcoord + offset) + 
						texture2D(gm_BaseTexture, v_vTexcoord + offset * (1.0 - aberration)) +
						texture2D(gm_BaseTexture, v_vTexcoord + offset * (1.0 + aberration))) *
						0.33;*/
	
	// v3a: Chromatic Aberation magenta/cyan:------------------------------
	out_col			=	(texture2D(gm_BaseTexture, v_vTexcoord + offset) +                   //vec4(vec3(1.0, 1.0, 1.0), 1.0)
						texture2D(gm_BaseTexture, v_vTexcoord + offset * (1.0 - aberration)) * vec4(vec3(1.0, 0.0, 1.0), 1.0) +
						texture2D(gm_BaseTexture, v_vTexcoord + offset * (1.0 + aberration)) * vec4(vec3(0.0, 1.0, 1.0), 1.0)) *
						vec4(0.5, 0.5, 0.33, 0.33);                                          //          2.0  2.0  3.0   3.0 -> * 0.5, 0.5, 0.33, 0.33
	
	// v3b: Chromatic Aberation orange/blue:------------------------------
	/*out_col			=	(texture2D(gm_BaseTexture, v_vTexcoord + offset) +                   //vec4(vec3(1.0, 1.0, 1.0), 1.0)
						texture2D(gm_BaseTexture, v_vTexcoord + offset * (1.0 - aberration)) * vec4(vec3(1.0, 0.5, 0.0), 1.0) +
						texture2D(gm_BaseTexture, v_vTexcoord + offset * (1.0 + aberration)) * vec4(vec3(0.0, 0.5, 1.0), 1.0)) *
						vec4(0.5, 0.5, 0.5, 0.33);                                               //      2.0  2.0  2.0   3.0 -> * 0.5, 0.5, 0.5, 0.33
	*/
	
	
	// --------------------------------------------------------------------
	// OPTIONAL BORDER:
	// --------------------------------------------------------------------	
	float border	=	step(abs(v_vTexcoord.x + offset.x - 0.5), 0.5) *
						step(abs(v_vTexcoord.y + offset.y - 0.5), 0.5);
	out_col.rgb		=	out_col.rgb * border + (1.0 - border) * BORDER_COL;
	
	
	
	// --------------------------------------------------------------------
	// OUTPUT:
	// --------------------------------------------------------------------
	gl_FragColor	= out_col;
}
