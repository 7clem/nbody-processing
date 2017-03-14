class CompositeBody implements AbstractBody {
  ArrayList<Body> bodies;
  PVector centerOfMass;
  float maxX, maxY, minX, minY; 

  CompositeBody() {
    this.bodies = new ArrayList<Body>();
  }

  PVector centerOfMass() {
    PVector cm = new PVector();
    float totalMass = 0.0;
    
    // barycenter wheigted
    for (Body b : this.bodies) {
      cm.add(b.pos).mult(b.mass);
      totalMass += b.mass;
    }
    cm.div(totalMass);
    //println(" / " + totalMass + " = " + printPV(cm));
    return cm;
  }
  
  // quantity of movement
  PVector QM() {
    PVector qm = new PVector();
    ArrayList<Body> 
    for (Body b : this.bodies) {
      qm.add(b.spd.mult(b.mass());
    }
  }

  PVector pos() { return new PVector(); } // should really return centerOfMass(); 
  
  float mass() { 
    float m = 0;
    for (Body b : bodies) {
      m += b.mass();
    }
    return m;
  }
  
  void showSpeed(){} // no op
  
  // 
  float radius(){
    float dx = maxX - minX;
    float dy = maxY - minY;
    float dx2 = dx * dx;
    float dy2 = dy * dy;
    return sqrt( dx2 + dy2) / 2;
  }
  
  void addBody(Body b) {
    float bodyMass = b.mass();
    for (int i = 0; i < bodies.size() ; i++) {
      if (b.mass() > bodies.get(i).mass() ) {
         bodies.add(i, b); 
      } else {
         bodies.add(b);
      }
  }

  void calcForces() {
    // for every pair of bodies
    for (Body a : this.bodies) {
      for (Body b : this.bodies) {
        if (a != b) {
          // only gravitation for now
          a.applyForce( gravitation(a, b));
        }
      }
    }
  }

  void update() {
    calcForces();
    // to calculate the extent of the system
    maxX = minX = bodies.get(0).pos.x;
    maxY = minY = bodies.get(0).pos.y;
    
    for (Body b : this.bodies) {
      b.update();
      maxX = (b.pos.x > maxX) ? b.pos.x : maxX;
      maxY = (b.pos.y > maxY) ? b.pos.y : maxY;
      minX = (b.pos.x < minX) ? b.pos.x : minX;
      minY = (b.pos.y < minY) ? b.pos.y : minY;
    }
  }


  void show() {
    stroke(128, 128, 255);
    PVector cm = this.centerOfMass();
    line(cm.x, cm.y-5, cm.x, cm.y+5);
    line(cm.x-5, cm.y, cm.x+5, cm.y);
    //translate(this.centerOfMass().x, this.centerOfMass().y);
    for (Body b : this.bodies) {
      b.show();
    }
  }
  
  void applyForce(PVector f){
    
  }
} // class BSystem