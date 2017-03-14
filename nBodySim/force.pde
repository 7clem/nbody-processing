
PVector gravitation(Body a, Body b) {
  PVector ab = PVector.sub(a.pos, b.pos);  
  float d = ab.mag();
  assert (d != 0); 
  ab.normalize();
  return ab.mult(-G * a.mass * b.mass / (d*d));
}

float escapeVelocity(Body_interface big, PVector m){
  
  // where m is the position of a small body 'orbiting' a big one
  
  // from https://en.wikipedia.org/wiki/Orbital_speed#Tangential_velocities_at_altitude
  // v0 = sqrt (2*GM / r)
  PVector Mm = PVector.sub(m, big.pos());
  return sqrt(2 * G * big.mass() / Mm.mag() ) ;
}