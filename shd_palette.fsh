#region Variable declarations

#region Varyings
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

#endregion

#region Uniforms
uniform float u_palettePixelW;		// Width of a pixel on the palette
uniform float u_palettePixelH;		// Width of a pixel on the palette
uniform float u_paletteLine;		// Line of the palette to read from
uniform float u_paletteUV[8];		// 0 = left, 1 = top, 2 = right, 3 = bottom, 4 = pixels trimmed from left side, 5 = pixels trimmed from top side, 6 = x pixel percentage, 7 = y pixel percentage
uniform sampler2D s_palette;

#endregion

vec2 pixel_size = vec2(u_palettePixelW * u_paletteUV[6], u_palettePixelH * u_paletteUV[7]);
float palette_width = u_paletteUV[2] - u_paletteUV[0];
vec2 uv_origin = vec2(u_paletteUV[0], u_paletteUV[1]);

#endregion



void main() {
	// Colors
	vec4 base_color = texture2D(gm_BaseTexture, v_vTexcoord);
	float color_grayscale = (base_color.r + base_color.g + base_color.b) / 3.0;
	
	// Palette
	vec2 palette_coord = uv_origin + vec2(color_grayscale * palette_width, u_paletteLine * pixel_size.y);		// Coordinate on the palette to sample color from
	vec4 palette_color = texture2D(s_palette, palette_coord);
	
    gl_FragColor = palette_color;
}
