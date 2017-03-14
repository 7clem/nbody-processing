class Body extends AbstractBody {
  float mass;
  PVector pos;
  PVector spd;
  PVector acc;
  PVector periapse, apoapse;
  Body_interface parent;
  float radius;
  //ArrayList<PVector> trace;
   
  Body(float mass, PVector pos, PVector spd, Body_interface parent){  
    this.parent = parent;     // body by which it is gravitationaly influenced.
    this.mass = mass;
    this.radius = this.radius();
    this.pos = pos;
    this.spd = spd;
    this.acc = new PVector(0.0, 0.0);
    this.periapse = new PVector();
    this.apoapse = new PVector();
  }
  
  float mass() {return this.mass;}
  
  PVector pos() {return this.pos;}
  
  float radius(){
   return 3.0 * pow(mass, 1/3) / 4.0; 
  }
  
  PVector QV() {
     return new PVector(this.spd.x, this.spd.y).mult(this.mass); 
  }
  
  void show(){
    fill(255);
    noStroke();
    float r = radius() * bodyScale;
    ellipse(this.pos.x, this.pos.y, 2*r, 2*r);
    this.showSpeed();
    
  }
  
  void showSpeed(){
    if (show_speed) {
      if (escapeVelocity(this.parent, pos) < spd.mag() ){
        stroke(255, 0, 0);
      } else {
        stroke(0, 0 ,255);
      }
      line(this.pos.x, this.pos.y, this.pos.x + this.spd.x * spd_scale, this.pos.y + this.spd.y * spd_scale);
    }
  }
    
  
  String toString(){
    String s = "";
    s += "Mass=" + this.mass;
    s += " Pos=" + printPV(this.pos);
    s += " Spd=" + printPV(this.spd);
    s += " Acc=" + printPV(this.acc);
    return s;
  }
  
  void update(){
    this.spd.add(this.acc);
    this.pos.add(this.spd);

    // clear acceleration until next step
    this.acc.mult(0);
  }
  
  void applyForce(PVector f){
    this.acc.add(f.div(this.mass));
  }
  
} // class Body