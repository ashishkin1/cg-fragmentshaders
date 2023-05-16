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
    FragColor = texture(image, model_uv);
    float r = 1.0 - FragColor.r;
    float g = 1.0 - FragColor.g;
    float b = 1.0 - FragColor.b;
    // a stays the same
    FragColor = vec4(r, g, b, FragColor.a);
}
