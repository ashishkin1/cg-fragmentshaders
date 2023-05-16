#version 300 es
precision mediump float;

// Input
in vec2 model_uv;   // Texture Coordinate
uniform float time;

// Uniforms
uniform sampler2D image;

// Output
out vec4 FragColor;

void main() {
    // Color
    // This filter creates a ripple effect similar to dropping a pebble in a pond
    // In order to accomplish a ripple effect, implement the following equations:
    // scale and translate the texture coordinate such that it is in the range [-1.0, 1.0]
    // multiply by 2, then subtract 1
    // calculate radius = magnitude of texture coordinate
    // calculate a texture coordinate offset = texture_coordinate * (sin(radius * 30.0 - time * 5.0) + 0.5) / 60.0
    // calculate final texture coordinate = original_texture_coordinate + texture_coordinate_offset
    FragColor = texture(image, model_uv);

    vec2 scaled = (model_uv * 2.0) - 1.0;

    float radius = length(scaled);

    vec2 offest = scaled * (sin(radius * 30.0 - time * 5.0) + 0.5) / 60.0;
    vec2 final = model_uv + offest;

    FragColor = texture(image, final);
    
}
