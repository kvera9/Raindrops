class Catcher {
  PImage umb;
  int h;
  int w;
  PVector mouse;

  Catcher () {
//    umb = loadImage("umbrella.png");
    h = 50;
    w = 50;
    mouse = new PVector(mouseX, mouseY);
  }
  
  
//displaying the catcher itself

//  void display() {
//    imageMode(CENTER);
//    mouse.set(mouseX, mouseY);
//    image(umb, mouse.x,mouse.y, w, h);
//    
//  }
//  
  

 void display() {
  fill(255);
  mouse.set(mouseX, mouseY);
  ellipse(mouse.x, mouse.y, w, w);
 }
  
  
  
//function so that the raindrops with disappear when they come in contact with the catcher
  void catchDrop(Raindrops r) {
    if (mouse.dist(r.loc) < w/2 + r.w/2) {
      r.loc = new PVector(random(width), random(0,-100));
    }
  }



}

