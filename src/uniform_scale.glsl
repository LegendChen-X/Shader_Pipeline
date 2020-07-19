// Inputs:
//   s  amount to scale in all directions
// Return a 4x4 matrix that scales and input 3D position/vector by s in all 3
// directions.
mat4 uniform_scale(float s)
{
  /////////////////////////////////////////////////////////////////////////////
  // Replace with your code
    mat4 res = identity() * s;
    res[3][3] = 1;
    return res;
  /////////////////////////////////////////////////////////////////////////////
}

