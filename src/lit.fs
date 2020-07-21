// Add (hard code) an orbiting (point or directional) light to the scene. Light
// the scene using the Blinn-Phong Lighting Model.
//
// Uniforms:
uniform mat4 view;
uniform mat4 proj;
uniform float animation_seconds;
uniform bool is_moon;
// Inputs:
in vec3 sphere_fs_in;
in vec3 normal_fs_in;
in vec4 pos_fs_in; 
in vec4 view_pos_fs_in; 
// Outputs:
out vec3 color;
// expects: PI, blinn_phong
void main()
{
    vec3 ka;
    vec3 kd;
    vec3 ks;
    
    float p = 1000;
    
    vec4 position = vec4(cos(M_PI/4 * animation_seconds)*5, 2, sin(M_PI/4 * animation_seconds)*5, 1);
    
    vec4 light = view * position;
    
    vec3 l_ray = light.xyz / light.w;
    
    vec3 v_ray = view_pos_fs_in.xyz / view_pos_fs_in.w;
    
    if(is_moon)
    {
        ka = vec3(0.03,0.03,0.03);
        kd = vec3(0.27,0.27,0.27);
        ks = vec3(0.88,0.88,0.88);
    }
    else
    {
        ka = vec3(0.03,0.03,0.03);
        kd = vec3(0.18,0.32,0.69);
        ks = vec3(0.88,0.88,0.88);
    }
    
    color = blinn_phong(ka,kd,ks,p,normalize(normal_fs_in),normalize(-v_ray),normalize(l_ray-v_ray));
}
