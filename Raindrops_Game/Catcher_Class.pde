class Catcher {
  PImage umb;
  int h;
  int w;
  PVector mouse;
  int score;
  int life;
  float x;

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
  void GameOver(Raindrops r) {
    if (r.loc.y >= height) {
      life++;
    }
    if (life > 5) {
      background(0);
      textAlign(CENTER);
      textSize(100);
      fill(x, 100, 100);
      text("GameOver", width/2, height/2); 
      x+=0.25;
      if (x == 360) {
      x = 0;
      }
      textSize(50);
      text(score,width/2,2*height/3);
    }
  }
}

