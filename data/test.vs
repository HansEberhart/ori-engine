#version 450

layout(location = 0) in vec3 position;
layout(location = 1) in vec2 tex_coord;
layout(location = 2) in vec3 normal;
layout(location = 3) in vec3 tangent;
layout(location = 4) in vec3 color;

layout(location = 0) out vec3 v_normal;
layout(location = 1) out vec2 tex_coordinates;


layout(set = 0, binding = 0) uniform Data {
    mat4 model;
    mat4 view;
    mat4 proj;
} u_main;

void main() {
    mat4 modelview = u_main.view * u_main.model;
    v_normal = transpose(inverse(mat3(modelview))) * normal;
    gl_Position = u_main.proj * modelview * vec4(position, 1.0);
    tex_coordinates = tex_coord;
}
