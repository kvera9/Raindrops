Raindrops [] Drops = new Raindrops [500];
Timer A = new Timer();
Catcher C = new Catcher();



int index = 1;
PImage storm;

void setup() {
  storm = loadImage("Rainstorm background.png");
  colorMode(HSB, 360, 100, 100);
  size(storm.width, storm.height);
  for (int i = 0; i < Drops.length; i++) {
    Drops[i] = new Raindrops();
  }
}

void draw() {
  background(storm);
  textSize(50);
  text(C.score, 20, 100);
  C.display();

  for (int i = 0; i < index; i++) {
    Drops[i].display();
    Drops[i].drop();
    C.catchDrop(Drops[i]);
    C.GameOver(Drops[i]);
    Drops[i].reset();
  }
  if (A.time() >= 1000 && index < Drops.length) {  
    index++;
    A.OldTime = millis();
  }
}

