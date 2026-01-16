shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
}

uniform float progress : hint_range(0.0, 1.0) = 0.0;

void fragment() {
    vec2 uv = UV - 0.5;
    float dist = length(uv) * 1.0;
    float vignette = smoothstep(progress - 0.5, progress + 0.01, dist);

    COLOR = vec4(0.0, 0.0, 0.0, vignette);
}
