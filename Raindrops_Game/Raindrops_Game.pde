//Arrays used in order to produce multiple raindrops, in this specific case 500
//The Raindrops Array, Named Drops
Raindrops [] Drops = new Raindrops [500];
//Timer and Catcher
Timer A = new Timer();
Catcher C = new Catcher();

//declaring variables
int index = 1;
//image for the background of the game
PImage storm;
//boolean to run the game
boolean run;
//variable controlling the fill of Game Over text
float x = 0;
//variables controlling the fill of the background in the starting screen
float y = 11;
int yspeed = 3;
//boolean used to pause the game
boolean pause;
//gameover boolean, when recognized it flashes the game over screen
boolean gameOver;
//lives, starts at five to give the player five lives
int lives = 5;
//restart boolean
boolean restart;


void setup() {
  //run starts as false in order to display the start screen
  run = false;
  //pause is also false in order to run the game 
  pause = false;
  //gameOver starts as false in order to let the game run
  gameOver = false;
  //Restart
  restart= true;
  //storm background
  storm = loadImage("Rainstorm background.png");
  //change color mode so that the fill will be different colors
  colorMode(HSB, 360, 100, 100);
  //the game is the size of the storm background image
  size(storm.width, storm.height);
  //for loop so that multiple raindrops will be produced
  for (int i = 0; i < Drops.length; i++) {
    Drops[i] = new Raindrops();
  }
}

void draw() {
  //for the start screen, run is not true yet
  if (!run) {
    //makes it so the background changes color
    y+=yspeed;
    //to color the background in RGB mode
    colorMode(RGB, 255, 255, 255);
    fill(0, 0, y);
    background (0, 0, y);
    textSize(45);
    textAlign(CENTER);
    fill(255);
    //text
    text("Press 'S' to START", width/2, height/3);
    text("Click the Mouse to PAUSE", width/2, height/3*2);
    text("Press 'R' to RESTART", width/2, height/2); 
    //to make the nackground change different blues
    if (y < 10) {
      yspeed = -yspeed;
    }
    if (y >255) {
      yspeed = -yspeed;
    }
    //resets color mode to HSb for the ellipse later on and for the game over screen
    colorMode(HSB, 360, 100, 100);
  }

  //controlling all of the display while the game runs
  if (run) {
    //background made to be storm
    background(storm);
    C.display();
    //text size for the score and for the player's lives
    textSize(20);
    text("Score:", 40, 375);
    text(C.score, 95, 375);
    text("Lives:", 500, 375);
    text(lives, 550, 375);
    //always less drops than the index
    for (int i = 0; i < index; i++) {
      //to display the raindrops
      Drops[i].display();
      //to ensure that when the game is not paused the raindrops drop and the catcher recognizes the raindrops
      if (!pause) {
        Drops[i].drop();
        C.catchDrop(Drops[i]);
      }
      //if the raindrops hit the bottom, the player's lives decrease
      if (Drops[i].loc.y >= height) {
        lives--;
      }
      //Reset property of Raindrops Class, ensures raindrop resets to the top of the screen
      Drops[i].reset();
    }
    //Timer Class properties 
    A.time();
  }

  //this if statement describes that, once you lose a certain amount of lives, it's Game Over, and the Game over end screen is displayed
  if (lives <= 0) {
    gameOver = true;
  }

//when the game is paused, the game will freeze and a text "paused" will display on the screen
  if (pause && run) {    
    textAlign(CENTER);
    textSize(45);
    text("Paused", width/2, height/2);
  }
  //When gameOver is true
  if (gameOver) {
    //Black Background for gameover
    background(0);
    //Center text
    textAlign(CENTER);
    //Change text size for game over
    textSize(100);
    fill(x, 100, 100);
    text("GameOver", width/2, height/2);
    textSize(25);
    text("Wanna play again? Press 'R'!", width/2, height/4*3); 
    //to change the color of the text
    x+=0.75;
    if (x == 360) {
      x = 0;
    } 
    //relocate the drops once it's game over to ensure the score doesn't increase after the game ends
    for (int i = 0; i < Drops.length; i++) {
      Drops[i].die();
    }
    //The score is displayed to show the gamer their final score once the Game is over
    textSize(50);
    text(C.score, width/2, 2*height/3);
  }
}
//when the key is pressed the game pauses
void mousePressed() {
  pause = !pause;
}

void keyPressed() {
  //"S" is pressed to start the game
  if (key == 's') {
    run = true;
  }
  /*"R" is pressed to restart the game and everything necessary is reset in order to play the game once again.
  the player is given 5 lives once again and the index, score, and booleans are reset 
  */
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

