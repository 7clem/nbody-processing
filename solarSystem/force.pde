
PVector gravitation(Body a, Body b) {
  float G = 100.0;
  PVector ab = PVector.sub(a.pos, b.pos);  
  float d = ab.mag();
  assert (d != 0); 
  ab.normalize();
  return ab.mult(-G * a.mass * b.mass / (d*d));
}