
Raindrops [] Drops = new Raindrops [100];
//Timer A = new Timer();
Catcher C = new Catcher();



int index = 50;
PImage storm;

void setup() {
  storm = loadImage("Rainstorm background.png");

  size(storm.width, storm.height);


  for (int i = 0; i < Drops.length; i++) {
    Drops[i] = new Raindrops();
  }
}

void draw() {
  background(storm);
  C.display();
  for (int i = 0; i < index; i++) {
    Drops[i].display();
    Drops[i].drop();
    C.catchDrop(Drops[i]);
  }
  //  if (A.time >= 50 && index < Drops.length) {  
  //    index++;
  //    A.OldTime = A.currentTime;
  //  }
}

