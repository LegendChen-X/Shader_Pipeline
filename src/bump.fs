// Set the pixel color using Blinn-Phong shading (e.g., with constant blue and
// gray material color) with a bumpy texture.
// 
// Uniforms:
uniform mat4 view;
uniform mat4 proj;
uniform float animation_seconds;
uniform bool is_moon;
// Inputs:
//                     linearly interpolated from tessellation evaluation shader
//                     output
in vec3 sphere_fs_in;
in vec3 normal_fs_in;
in vec4 pos_fs_in; 
in vec4 view_pos_fs_in; 
// Outputs:
//               rgb color of this pixel
out vec3 color;
// expects: model, blinn_phong, bump_height, bump_position,
// improved_perlin_noise, tangent
void main()
{
    vec3 ka;
    vec3 kd;
    vec3 ks;
    float p = 1000;
    
    vec4 orbit = view * vec4(4*cos(M_PI / 2 * animation_seconds), 2, 4*sin(M_PI / 2 * animation_seconds), 1);
    vec3 l_ray = orbit.xyz / orbit.w;
    vec3 v_ray = view_pos_fs_in.xyz / view_pos_fs_in.w;
    
    vec3 T;
    vec3 B;
    tangent(normalize(sphere_fs_in), T, B);
    
    float epsilon = 0.0001;
    vec3 dp_T = (bump_position(is_moon, sphere_fs_in + T*epsilon) - bump_position(is_moon, sphere_fs_in))/epsilon;
    vec3 dp_B = (bump_position(is_moon, sphere_fs_in + B*epsilon) - bump_position(is_moon, sphere_fs_in))/epsilon;
    vec3 p_normal = cross(dp_T,dp_B);
    p_normal = p_normal / length(p_normal);
    
    
    mat4 model = model(is_moon, animation_seconds);
    vec3 normal = (transpose(inverse(view * model)) * vec4(p_normal,1)).xyz;
    
    vec3 n = normalize(normal);
    vec3 v = normalize(-v_ray);
    vec3 l = normalize(l_ray-v_ray);
    
    if(is_moon) color = blinn_phong(vec3(0.05,0.05,0.05), vec3(0.5,0.5,0.5), vec3(0.8,0.8,0.8), p, n, v, l);
    else color = blinn_phong(vec3(0.05,0.05,0.05), vec3(0.1,0.1,0.9), vec3(0.8,0.8,0.8), p, n, v, l);
}
