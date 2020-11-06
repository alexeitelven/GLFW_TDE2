#version 330 core
out vec4 FragColor;

in vec3 cor;


void main()
{
    // Output to screen
    FragColor = vec4(cor, 1.0);
};
