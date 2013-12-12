//Arrays used in order to produce multiple raindrops
//Raindrops
Raindrops [] Drops = new Raindrops [500];
//Timer and Catcher
Timer A = new Timer();
Catcher C = new Catcher();

//declare variables
int index = 1;
//image for the background
PImage storm;
//boolean to start and pause game
boolean run;
//variable that, once increased to a certain amount, causes you to lose the game
int life;
//variable controlling the fill of Game Over text
float x;

void setup() {
  //boolean starts as true
  run = false;
  //storm background
  storm = loadImage("Rainstorm background.png");
  //change color mode so that the fill will be different colors
  colorMode(HSB, 360, 100, 100);
  size(storm.width, storm.height);
  //for loop so that multiple raindrops will be produced
  for (int i = 0; i < Drops.length; i++) {
    Drops[i] = new Raindrops();
  }
}

void draw() {
  //controlling all of the display while the game runs
  if (run) {
    //background made to be storm
    background(storm);
    C.display();
    //text size for the score
    textSize(50);
    text(C.score, 20, 100);
    for (int i = 0; i < index; i++) {
      //to display the raindrops
      Drops[i].display();
      //to ensure the raindrops drop
      Drops[i].drop();
      //once the raindrops come in contact with the catcher they are seny back to reset
      C.catchDrop(Drops[i]);
      if (Drops[i].loc.y >= height) {
        life++;
      }
      //Reset, as stated before
      Drops[i].reset();
      //this if statement describes that, once you lose a certain amount of lives, it's Game Over, adn the Game over end screen is displayed
      if (life > 5) {
        //Black Background
        background(0);
        //Center text
        textAlign(CENTER);
        //Change text size for game over
        textSize(100);
        fill(x, 100, 100);
        text("GameOver", width/2, height/2); 
        x+=0.25;
        //relocate the drops once it's game over to ensure the score doesn't increase after the game ends
        Drops[i].die();
        if (x == 360) {
          x = 0;
        } 
        //The score is displayed to show the gamer their final score once the Game is over
        textSize(50);
        text(C.score, width/2, 2*height/3);
      }
    }
    //Timer Class properties 
    if (A.time() >= 1000 && index < Drops.length) {  
      index++;
      A.OldTime = millis();
    }
  }
  else {
    background (255);
    text("press any key to start", width/2, height/2);
  }
}
//when the key is pressed the 
void mousePressed() {
  if (life <= 5) {    
    textAlign(CENTER);
    textSize(45);
    text("Paused", width/2, height/2);
  }
}

void keyPressed() {
  run = true;
}

