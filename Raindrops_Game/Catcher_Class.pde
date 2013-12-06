class Catcher {
PImage umb;
int uh;
int uw;

  Catcher () {
    umb = loadImage("Red Umbrella_edit.png");
    uh = 20;
    uw = 20;
  }
  
  void display() {
  imageMode(CENTER);
  image(umb,mouseX,mouseY,uw,uh);  
  
  }
  
  
  
}

