class Raindrops {
  PVector loc;
  PVector vel;
  int w;
  int h;
  PImage raindrop;




  Raindrops () {
    //expressing the values of variables, and stating properties of pvectors
    loc = new PVector(random(width), -20);
    vel = new PVector(0, 2);
    raindrop = loadImage("raindrop_edit.png");
    w = 20;
    h = 30;
  }

  void display() {
    //displaying a drop
   imageMode(CENTER);
   image(raindrop, loc.x, loc.y, w, h);
   
  }

  void drop() {
    //velocity so that the raindorops drop
    loc.add(vel);
  }


  void reset() {
    //resets the raindrops if they reach the height, so that they don't continue past the screen
    if (loc.y >= height) {
      loc.y = 0;
    }
  }
  
  void die() {
    //offesets the raindrops to avoid increasing the score when the game is over
    loc.set(width*2,0);
    vel.set(0,0);
  }
}

