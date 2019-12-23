#version 400

layout (location = 0) in vec3 pos;
layout (location = 1) in vec3 normals;
layout (location = 2) in vec2 texCoord;

out vec2 textureCoord;
out vec3 norm;
out vec3 fragPos;

uniform mat4 MVP;
uniform mat4 model;
uniform int t;
uniform int ai;
uniform vec2 di;
uniform float wi;
uniform float fi;

void main()
{
	textureCoord = texCoord;
	vec3 p = pos;

	//these parameters should be defined in the main function and sent as uniform variables
	p.y = pos.y + 2 * ai * pow ((sin (dot(di, vec2(pos.x, pos.z)) * wi + t * fi) + 1) / 2, 2);

	fragPos = vec3(model * vec4(p, 1.0f));
	norm = mat3(transpose(inverse(model)))*normals;
	gl_Position = MVP * vec4(p, 1.0f);
}