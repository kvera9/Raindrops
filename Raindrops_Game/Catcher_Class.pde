class Catcher {
  PImage umb;
  int h;
  int w;
  PVector mouse;
  int score;



  Catcher () {
    //umb = loadImage("umbrella.png");
    h = 50;
    w = 50;
    mouse = new PVector(mouseX, mouseY);
  }


  //displaying the catcher itself
/*
       void display() {
      imageMode(CENTER);
      mouse.set(mouseX, mouseY);
      image(umb, mouse.x,mouse.y, w, h);
      
  }
 */

//catcher displayed as an ellipse because umbrella image was faced with technical difficulties
  void display() {
    fill(230,100,100);
    mouse.set(mouseX, mouseY);
    ellipse(mouse.x, mouse.y, w, w);
  }



  //function so that the raindrops with disappear when they come in contact with the catcher
  void catchDrop(Raindrops r) {
    if (mouse.dist(r.loc) < w/2 + r.w/2) {
      r.loc = new PVector(random(width), random(0, -100));
      score++;
    }
  }
  
  }


