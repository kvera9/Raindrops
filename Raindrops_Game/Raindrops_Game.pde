
Raindrops [] Drops = new Raindrops [1000];
Timer A = new Timer();
Catcher C = new Catcher();



int index;
PImage storm;

void setup() {
  storm = loadImage("Rainstorm background.png");
  C.display();
  
  
  for (int i = 0; i < Drops.length; i++) {
    Drops[i] = new Raindrops();
  }
}

void draw() {
  background(storm);
  for (int i = 0; i < index; i++) {
    Drops[i].display();
    Drops[i].drop();
  }
  if (A.time >= 50 && index < Drops.length) {  
    index++;
    A.OldTime = A.currentTime;
  }
