class Catcher {
  PImage umb;
  int uh;
  int uw;
  PVector mouse;

  Catcher () {
    umb = loadImage("Red Umbrella_edit.png");
    uh = 20;
    uw = 20;
    mouse = new PVector(mouseX, mouseY);
  }

  void display() {
    imageMode(CENTER);
    image(umb, mouseX, mouseY, uw, uh);
  }

  void _____ () {
  for(int i = 0; i < index; i++){
  if(mouse.dist(//allthe itmes in the array) < diamter of objects){
  Drops[i].reset();
  }
  
  
  
  
  }
  
  
  }
}

