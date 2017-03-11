class Body {
  float mass;
  PVector pos;
  PVector spd;
  PVector acc;
  ArrayList<PVector> trace;
   
  Body(float mass, PVector pos, PVector spd){  
    this.mass = mass;
    this.pos = pos;
    this.spd = spd;
    this.acc = new PVector(0.0, 0.0);
    this.trace = new ArrayList<PVector>(traceLength);
  }
  
  float radius(){
   return 3.0 * pow(mass, 1/3) / 4.0; 
  }
  
  void show(){
    fill(255);
    float diam = 3.0 * pow(mass, 1/3) / 2.0;
    noStroke();
    ellipse(this.pos.x, this.pos.y, diam, diam);
    this.showSpeed();
    
  }
  
  void showSpeed(){
    if (show_speed) {
      stroke(0, 0 ,255);
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
    this.acc.mult(0);
  }
  
  void applyForce(PVector f){
    this.acc.add(f.div(this.mass));
  }
  
} // class Body