//I tried doing this all with one ball class, but I kept getting null pointer exceptions
//in the update loop

//2 player game where the other player scores if a player misses
//the paddle size shrinks with each hit until the reset
//the speed increases with each hit until the reset

Ball1 ball1;
Ball2 ball2;
Paddle p1;
Paddle p2;

boolean p1up, p1down, p2up, p2down, p1left, p2left, p1right, p2right;
int score1, score2;

PImage bg;

void keyPressed() {
  if (key != CODED) {
    if (key == 'w') {
      p1up = true;
    } else if (key == 's') {
      p1down = true;
    } else if (key == 'a') {
      p1left = true;
    } else if (key == 'd') {
      p1right = true;
    }
  } else {
    if (keyCode == UP) {
      p2up = true;
    } else if (keyCode == DOWN) {
      p2down = true;
    } else if (keyCode == LEFT) {
      p2left = true;
    } else if (keyCode == RIGHT) {
      p2right = true;
    }
  }
}

void keyReleased() {
  if (key != CODED) {
    if (key == 'w') {
      p1up = false;
    } else if (key == 's') {
      p1down = false;
    } else if (key == 'a') {
      p1left = false;
    } else if (key == 'd') {
      p1right = false;
    }
  } else {
    if (keyCode == UP) {
      p2up = false;
    } else if (keyCode == DOWN) {
      p2down = false;
    } else if (keyCode == LEFT) {
      p2left = false;
    } else if (keyCode == RIGHT) {
      p2right = false;
    }
  }
}

void setup() {
  size(1000, 600);
  ball1 = new Ball1();
  ball2 = new Ball2();
  p1 = new Paddle(1);
  p2 = new Paddle(2);
  bg = loadImage("bg.jpg");
}

void draw() {
  image(bg, 0, 0);

  ball1.update();
  ball2.update();
  ball1.display();
  ball2.display();

  p1.update(1, p1left, p1right);
  p1.display();

  p2.update(2, p2left, p2right);
  p2.display();

  ball1.checkCollision(p1);
  ball2.checkCollision(p2);

  fill(255);
  textSize(64);
  textAlign(CENTER, CENTER);
  text(score1, 50, height/8 - 20);
  text(score2, width-50, height/8 - 20);

  for (int i=0; i < height; i+=30) {
    noStroke();
    rect(width/2, i, 10, 20);
  }
}
