// Input:
//   N  3D unit normal vector
// Outputs:
//   T  3D unit tangent vector
//   B  3D unit bitangent vector
void tangent(in vec3 N, out vec3 T, out vec3 B)
{
    //https://www.gamedev.net/forums/topic/552411-calculate-tangent-from-normal/
    vec3 v1 = cross(N,vec3(0.0,0.0,1.0));
    vec3 v2 = cross(N,vec3(0.0,1.0,0.0));
    
    if(length(v1)>length(v2))
    {
        T = normalize(v1);
        B = normalize(cross(T,N));
    }
    else
    {
        T = normalize(v2);
        B = normalize(cross(T,N));
    }
}
