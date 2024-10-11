shader_type sky;

uniform vec3 skyColor: source_color;
uniform vec3 horizonColor: source_color;

void sky() {
	float colorBase = clamp(EYEDIR.y / 0.05, 0.0, 1.0);
	COLOR = mix(horizonColor, skyColor, colorBase);
}
