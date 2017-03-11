class BSystem {
  ArrayList<Body> bodies;
  PVector centerOfMass;


  BSystem() {
    this.bodies = new ArrayList<Body>();
  }

  PVector centerOfMass() {
    PVector cm = new PVector();
    float totalMass = 0.0;
    
    for (Body b : this.bodies) {
      //print(" + " + printPV(b.pos) + " * " + b.mass);
      cm.add(b.pos).mult(b.mass);
      totalMass += b.mass;
    }
    cm.div(totalMass);
    //println(" / " + totalMass + " = " + printPV(cm));
    return cm;
  }


  void addBody(Body b) {
    this.bodies.add(b);
  }

  void calcForces() {
    for (Body a : this.bodies) {
      for (Body b : this.bodies) {
        if (a != b) {
          a.applyForce( gravitation(a, b));
        }
      }
    }
  }

  void update() {
    calcForces();
    for (Body b : this.bodies) {
      b.update();
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
} // class BSystem