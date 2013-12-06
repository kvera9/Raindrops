
Raindrops [] Drops = new Raindrops [1000];
Timer A = new Timer();

int index;

void setup() {
  for (int i = 0; i < Drops.length; i++) {
    Drops[i] = new Raindrops();
  }
}

void draw() {
  background(0);
  for (int i = 0; i < index; i++) {
    Drops[i].display();
    Drops[i].drop();
  }
  if (A.time >= 50 && index < Drops.length) {  
    index++;
    A.OldTime = A.currentTime;
  }
