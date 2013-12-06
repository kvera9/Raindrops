class Raindrops {
  PVector loc;
  PVector vel;
  int kw;
  int kh;
  PImage raindrop;



  Raindrops () {
    loc = new PVector(random(width), random(0,-100));
    vel = new PVector(0, random(10));
    raindrop = loadImage("raindrop_edit.png");
    kw = 20;
    kh = 30;
  }

  void display() {
   imageMode(CENTER);
   image(raindrop, loc.x, loc.y, kw, kh);
  }

  void drop() {
    loc.add(vel);
  }


  void reset() {
    if (loc.y >=height) {
      loc.y = 0;
    }
  }
  
  
}

