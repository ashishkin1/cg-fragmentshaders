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
   // This filter will round each color component to one of 5 levels (0.0, 0.25, 0.5, 0.75, 1.0)
   // Rounding can be done by multiplying by 4.0, then rounding, then dividing by 4.0
   // The result should be a cartoon-ish looking image

   float r = round((FragColor.r * 4.0)/ 4.0);
   float g = round((FragColor.g * 4.0)/ 4.0);
   float b = round((FragColor.b * 4.0)/ 4.0);
   float a = round((FragColor.a * 4.0)/ 4.0);

   FragColor = vec4(r, g, b, a);
}
