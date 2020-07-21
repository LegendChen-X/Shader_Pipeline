// Given a 3d position as a seed, compute a smooth procedural noise
// value: "Perlin Noise", also known as "Gradient noise".
//
// Inputs:
//   st  3D seed
// Returns a smooth value between (-1,1)
//
// expects: random_direction, smooth_step
float perlin_noise( vec3 st) 
{
    vec3 st0 = floor(st);
    vec3 st1 = ceil(st);
    
    vec3 v0 = vec3(st0.x, st0.y, st0.z);
    vec3 v1 = vec3(st1.x, st0.y, st0.z);
    vec3 v2 = vec3(st0.x, st1.y, st0.z);
    vec3 v3 = vec3(st1.x, st1.y, st0.z);
    vec3 v4 = vec3(st0.x, st0.y, st1.z);
    vec3 v5 = vec3(st1.x, st0.y, st1.z);
    vec3 v6 = vec3(st0.x, st1.y, st1.z);
    vec3 v7 = vec3(st1.x, st1.y, st1.z);
    
    vec3 g0 = random_direction(v0);
    vec3 g1 = random_direction(v1);
    vec3 g2 = random_direction(v2);
    vec3 g3 = random_direction(v3);
    vec3 g4 = random_direction(v4);
    vec3 g5 = random_direction(v5);
    vec3 g6 = random_direction(v6);
    vec3 g7 = random_direction(v7);
    
    vec3 d0 = st - v0;
    vec3 d1 = st - v1;
    vec3 d2 = st - v2;
    vec3 d3 = st - v3;
    vec3 d4 = st - v4;
    vec3 d5 = st - v5;
    vec3 d6 = st - v6;
    vec3 d7 = st - v7;
    
    float f0 = dot(g0,d0);
    float f1 = dot(g1,d1);
    float f2 = dot(g2,d2);
    float f3 = dot(g3,d3);
    float f4 = dot(g4,d4);
    float f5 = dot(g5,d5);
    float f6 = dot(g6,d6);
    float f7 = dot(g7,d7);
    
    vec3 sm = smooth_step(fract(st));
    
    float lix_01 = mix(f0,f1,sm.x);
    float lix_23 = mix(f2,f3,sm.x);
    float lix_45 = mix(f4,f5,sm.x);
    float lix_67 = mix(f6,f7,sm.x);
    
    float liy_0123 = mix(lix_01,lix_23,sm.y);
    float liy_4567 = mix(lix_45,lix_67,sm.y);
    
    return clamp(mix(liy_0123,liy_4567,sm.z)/sqrt(3),-1,1);
    
}

