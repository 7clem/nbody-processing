Body uni = new CompositeBody();
float spd_scale = 100.0;
float distScale = 5e-4;
float bodyScale = 1400.0;

float G = 1.0; // gravitation constant
boolean show_speed = true;
int traceLength = 10;
float simulationStepsPerFrame = 10;


void setup(){
  size(1000, 1000);
  frameRate(20);
  
  Body centralMassiveBody = new Body(10000, new PVector(0, 0), new PVector(0, 0), null);
  uni.addBody(centralMassiveBody);
  
  int nBodies = 100;
  for (int i = 0; i < nBodies; i++) {
    float r = 50 + random(1) * 600;
    float a = random(2 * PI);
    PVector pos = new PVector(r*cos(a), r*sin(a));
    float angle = PI/4 + random(PI / 6) - PI/12;
    PVector v = new PVector(1/r*cos(angle), 0.0001/r*sin(angle));
    //.rotate(pos, angle ).mult(1 / r);
    uni.addBody(new Body(10, pos, v, uni));
  }
  //running ? loop(): noLoop();
}
    
void draw(){
  background(0);
  translate(width/2, height/2);
  //translate(-uni.centerOfMass().x, -uni.centerOfMass().y);
  scale(distScale);
  for (int i = 0; i < simulationStepsPerFrame; i++) {
    uni.update();}
  uni.show();      
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  
  // positive and negative values
   distScale = constrain(distScale * pow(10, e/4), 1e-6, 1e12);
   spd_scale = constrain(spd_scale * pow(10, e/4), 1e-6, 1e12);
   println("distScale="+distScale); 
}

void keyPressed() {
  switch(key){
   case 'v': case 'V': show_speed = !show_speed; println("show_speed="+show_speed); break;
   case 'z': case 'Z': simulationStepsPerFrame *= 1.5; println("simulationStepsPerFrame=" + simulationStepsPerFrame); break;
   case 's': case 'S': simulationStepsPerFrame /= 1.5; println("simulationStepsPerFrame=" + simulationStepsPerFrame); break;
   case 'a': case 'A': bodyScale *= 1.5; println("bodyScale=" + bodyScale); break;
   case 'q': case 'Q': bodyScale /= 1.5; println("bodyScale=" + bodyScale); break;
   case 'e': case 'E': spd_scale *= 1.5; println("spd_scale=" + spd_scale); break;
   case 'd': case 'D': spd_scale /= 1.5; println("spd_scale=" + spd_scale); break;
  }
}