BSystem uni = new BSystem();
float spd_scale = 1.0;
float scale = 1.0/1000.0;

boolean show_speed = true;
boolean running = false;
int traceLength = 10;
float framerate = 5;

void setup(){
  size(1000, 1000);
  
  Body earth = new Body(10000, new PVector(0, 0), new PVector(0, 0));
  uni.addBody(earth);
  
  int nBodies = 2000;
  for (int i = 0; i < nBodies; i++) {
    float r = 400;
    float a = random(2 * PI);
    float s = map(random(1), 0, 1, 50, 150);
    uni.addBody(new Body(1, new PVector(r*cos(a), r*sin(a)), new PVector(s*cos(a+PI/2), s*sin(a+PI/2))));
  }
  frameRate(framerate);
  //running ? loop(): noLoop();
}
    
void draw(){
  background(0);
  translate(width/2, height/2);
  uni.show();      
  uni.update();
}

void keyPressed() {
  switch(key){
   case 'v': case 'V': show_speed = !show_speed; break;
   case 'z': case 'Z': framerate *= 1.5; break;
   case 's': case 'S': framerate /= 1.5; break;
  }
}