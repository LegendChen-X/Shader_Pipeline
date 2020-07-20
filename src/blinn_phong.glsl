// Compute Blinn-Phong Shading given a material specification, a point on a
// surface and a light direction. Assume the light is white and has a low
// ambient intensity.
//
// Inputs:
//   ka  rgb ambient color
//   kd  rgb diffuse color
//   ks  rgb specular color
//   p  specular exponent (shininess)
//   n  unit surface normal direction
//   v  unit direction from point on object to eye
//   l  unit light direction
// Returns rgb color
vec3 blinn_phong(
  vec3 ka,
  vec3 kd,
  vec3 ks,
  float p,
  vec3 n,
  vec3 v,
  vec3 l)
{
    vec3 res;
    vec3 light = vec3(1,1,1);
    vec3 ambi = ka * light;
    vec3 diff = kd * light * max(0,dot(n,l));
    vec3 spec = ks * light * pow(max(0,dot(n,normalize(v + l))),p);
    res = ambi + diff + spec;
    return res;
}


