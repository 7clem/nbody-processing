
PVector gravitation(Body a, Body b) {
  PVector ab = PVector.sub(a.pos, b.pos);  
  float d = ab.mag();
  assert (d != 0); 
  ab.normalize();
  return ab.mult(-G * a.mass * b.mass / (d*d));
}

PVector escapeVelocity(Body big, PVector m){
  
  // where M is the position a big body and m that of a small one, relatively
  
  // from https://en.wikipedia.org/wiki/Orbital_speed#Tangential_velocities_at_altitude
  // v0 = sqrt (2*GM / r)
  PVector Mm = PVector.sub(m, big.pos);
  PVector z = new PVector(0, 0, 1);
  return Mm.cross(z).mult(sqrt(2 * G * big.mass / Mm.mag())) ;
}