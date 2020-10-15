Simple palette shader to color a grayscale texture using a sprite acting as a palette map. Each palette on the map has to be horizontal, with each row of pixels acting as a new palette. Grayscale values correspond to the percentage along the palette to sample color from, pure black being the leftmost color and pure white being the rightmost color.



# Uniforms

u_palettePixelW: Width of a texel on the palette texture

u_palettePixelH: Height of a texel on the palette texture

u_paletteLine: Row of pixels to sample color from on the palette

u_paletteUV: An array of length 8 containing the UV of the palette sprite (result of sprite_get_uvs)

s_palette: The palette texture passed in as a sampler.