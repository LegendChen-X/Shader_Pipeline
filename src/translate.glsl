// Inputs:
//   t  3D vector by which to translate
// Return a 4x4 matrix that translates and 3D point by the given 3D vector
mat4 translate(vec3 t)
{
  /////////////////////////////////////////////////////////////////////////////
  // Replace with your code
    mat4 res = identity();
    res[0][3] = t.x;
    res[1][3] = t.y;
    res[2][3] = t.z;
    
    return res;
    
  /////////////////////////////////////////////////////////////////////////////
}

