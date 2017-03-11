BSystem uni = new BSystem();
float spd_scale = 100.0;
float distScale = 1.0/1000.0;
float bodyScale = 1000;

float G = 1.0; // gravitation constant
boolean show_speed = true;
boolean running = false;
int traceLength = 10;
float simulationStepsPerFrame = 5;


void setup(){
  size(1000, 1000);
  frameRate(20);
  
  Body centralMassiveBody = new Body(10000, new PVector(0, 0), new PVector(0, 0));
  uni.addBody(centralMassiveBody);
  
  int nBodies = 1;
  for (int i = 0; i < nBodies; i++) {
    float r = 400;
    float a = random(2 * PI);
    PVector pos = new PVector(r*cos(a), r*sin(a));
    PVector ov = escapeVelocity(centralMassiveBody, pos).mult(random(0.01));
    printPV(ov);
    uni.addBody(new Body(10, pos, ov));
  }
  //running ? loop(): noLoop();
}
    
void draw(){
  background(0);
  translate(width/2, height/2);
  scale(distScale);
  for (int i = 0; i < simulationStepsPerFrame; i++) {
    uni.update();}
  uni.show();      
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
   distScale *= (1 + e * 1.2);
   bodyScale *= (1 + e * 1.2);
   spd_scale *= (1 + e * 1.2);
}

void keyPressed() {
  switch(key){
   case 'v': case 'V': show_speed = !show_speed; break;
   case 'z': case 'Z': simulationStepsPerFrame *= 1.5; break;
   case 's': case 'S': simulationStepsPerFrame /= 1.5; break;
   case 'a': case 'A': bodyScale *= 1.5; break;
   case 'q': case 'Q': bodyScale /= 1.5; break;
   case 'e': case 'E': spd_scale *= 1.5; break;
   case 'd': case 'D': spd_scale /= 1.5; break;
  }
}