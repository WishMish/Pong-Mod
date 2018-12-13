class Ball1 {
  PVector pos, vel;
  float speed = 5;

  Ball1() {
    restart();
  }

  void restart() {
    float angle;
    angle = random(70, 130);
    pos = new PVector(width/4, height/8);
    vel = new PVector();
    vel.x = cos(radians(angle));
    vel.y = sin(radians(angle));
    vel.mult(speed);
  }

  void checkCollision(Paddle p) {
    if (ball1.pos.x < (p.pos.x + p.w) && 
      ball1.pos.x > (p.pos.x) &&
      ball1.pos.y > (p.pos.y -20) && 
      ball1.pos.y < (p.pos.y + p.h)) {
      ball1.vel.y = -ball1.vel.y;
      vel.mult((speed/4));
      p1.w-=10;
      if (p1.w<30) {
        p1.w=30;
      }
    }
  }

  void update() {

    if (pos.x < 0 || pos.x > width/2) {
      vel.x = -vel.x;
    }
    if (pos.y < 0) {
      vel.y = -vel.y;
    }

    pos.add(vel);

    if (pos.y > height) {
      restart();
      score2++;
      p1.w = 100;
    }
  }

  void display() {
    rectMode(CENTER);
    fill(255);
    rect(pos.x, pos.y, 25, 25);
  }
}
