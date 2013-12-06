Array

Raindrops[] Drops = new Raindrops[100];



void setup() {
  size(800, 800);
  for (int i = 0; i< Drops.length; i++) {
    Drops[i] = new Raindrops();
  }
}


void draw() {
 background(0);
  for (int i = 0; i < Drops.length; i++) {
    Drops[i].display();
    Drops[i].drop();
    Drops[i].reset();
  }
  
  
}














Raindrops [] drops = new Raindrops [1000];

int currentTime = 0;
int OldTime = 0;
int index;


void setup() {
  size(500, 500);

  for (int i = 0; i < drops.length; i++) {
    drops[i] = new Raindrops();
  }
}

void draw() {
  background(0);
  currentTime = millis();
  for (int i = 0; i < index; i++) {
    drops[i].display();
    drops[i].drop();
  }
  if (currentTime - OldTime >= 50 && index < drops.length) {  
    index++;
    OldTime = currentTime;
  }
