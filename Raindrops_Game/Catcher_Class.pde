class Catcher {
  //umbrella image
  PImage umb;
  //height of catcher
  int h;
  //width of catcher
  int w;
  //PVector to help with identifying distance 
  PVector mouse;
  //score variable so that it will increase along the side
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
    //once the distance between the two objects is les than them solely touching, the score increases and the location of the raindrop changes
    if (mouse.dist(r.loc) < w/2 + r.w/2) {
      r.loc = new PVector(random(width), random(0, -100));
      score++;
    }
  }
  
  }


