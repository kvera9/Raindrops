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
//variable controlling the fill of Game Over text
float x;
//to pause the game
boolean pause;
//gameover
boolean gameOver;
//lives
int lives = 5;
//restart
boolean restart;

void setup() {
  //boolean starts as true
  run = false;
  pause = false;
  gameOver = false;
  restart= true;
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

  if (!run) {
    background (255, 0, 0);
    textSize(30);
    textAlign(CENTER);
    text("Press 'S' to START", width/2, height/3);
    text("Click the Mouse to PAUSE", width/2, height/3*2);
  }

  //controlling all of the display while the game runs
  if (run) {
    //background made to be storm
    background(storm);
    C.display();
    //text size for the score
    textSize(20);
    text("Score:", 40, 375);
    text(C.score, 95, 375);
    text("Lives:", 500, 375);
    text(lives, 550, 375);
    for (int i = 0; i < index; i++) {
      //to display the raindrops
      Drops[i].display();
      //to ensure the raindrops drop
      if (!pause) {
        Drops[i].drop();
        C.catchDrop(Drops[i]);
      }//once the raindrops come in contact with the catcher they are sent back to reset

      if (Drops[i].loc.y >= height) {
        lives--;
      }
      //Reset, as stated before
      Drops[i].reset();
    }
    //Timer Class properties 
    A.time();
  }

  //this if statement describes that, once you lose a certain amount of lives, it's Game Over, adn the Game over end screen is displayed
  if (lives <= 0) {
    gameOver = true;
  }


  if (pause && run) {    
    textAlign(CENTER);
    textSize(45);
    text("Paused", width/2, height/2);
  }
  //Black Background
  if (gameOver) {


    //Center text
    textAlign(CENTER);
    //Change text size for game over
    textSize(100);
    fill(x, 100, 100);
    text("GameOver", width/2, height/2); 
    x+=0.25;
    //relocate the drops once it's game over to ensure the score doesn't increase after the game ends
    for (int i = 0; i < Drops.length; i++) {
      Drops[i].die();
    }
    if (x == 360) {
      x = 0;
    } 
    //The score is displayed to show the gamer their final score once the Game is over
    textSize(50);
    text(C.score, width/2, 2*height/3);
  }
}
//when the key is pressed the 
void mousePressed() {
  pause = !pause;
}

void keyPressed() {
  if (key == 's') {
    run = true;
  }
  if (key == 'r') {
    lives = 5;
    index = 1;
    C.score = 0;
    gameOver = false;
    run=true;
    for (int i = 0; i < Drops.length; i++) {
      Drops[i] = new Raindrops();
    }
  }
}

