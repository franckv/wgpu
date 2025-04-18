#version 450

#extension GL_EXT_buffer_reference: require

struct Vertex {
	vec3 position;
};

layout(buffer_reference, std430, buffer_reference_align=16) readonly buffer VertexBuffer {
	Vertex vertices[];
};

layout(push_constant) uniform constants {
	VertexBuffer vertex_buffer_address;
} push_constants;

void main() {
	Vertex v = push_constants.vertex_buffer_address.vertices[gl_VertexIndex];

	gl_Position = vec4(v.position, 1.f);
}
