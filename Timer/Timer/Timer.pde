color k;
color x;
int currentTime = 0;
int OldTime = 0;

void setup () {
  size(650, 650);
}

void draw() {
  background(k);
  currentTime = millis();

  textAlign(CENTER);
  textSize(100);
  text(frameCount, width/2, 150);
  text(currentTime, width/2, 400);

  if (currentTime - OldTime >= 2000) {
    x = color(random(255), random(255), random(255));
    OldTime = currentTime;
  }

  fill(x);
  ellipse(width/2, 450, 65, 65);
  rectMode(CENTER);
  rect(width/2, 200, 200,50);


  if (frameCount%100 == 0) {
    k = color(random(255), random(150), random(255));
  }
}

