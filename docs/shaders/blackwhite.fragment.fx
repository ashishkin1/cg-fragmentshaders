#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;

// Output
out vec4 FragColor;

void main() {
    // Color
    //Luminance is calculated as 
    FragColor = texture(image, model_uv);

    float L = (0.299 * FragColor.r) + (0.587 * FragColor.g) + (0.114 * FragColor.b);
    FragColor = vec4(L, L, L, FragColor.a);
}
