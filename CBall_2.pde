class Ball2 {
  PVector pos, vel;
  float speed = 5;
  Ball2() {
    restart();
  }
  void restart() {
    float angle = 0;
    angle = random(70, 130);
    pos = new PVector(width/2 + width/4, height/8);
    vel = new PVector();

    vel.x = cos(radians(angle));
    vel.y = sin(radians(angle));
    vel.mult(speed);
  }

  void checkCollision(Paddle p) {
    if (ball2.pos.x < (p.pos.x + p.w) && 
      ball2.pos.x > (p.pos.x) &&
      ball2.pos.y > (p.pos.y - 20) && 
      ball2.pos.y < (p.pos.y + p.h)) {
      ball2.vel.y = -ball1.vel.y;
      vel.mult((speed/4));
      p2.w-=10;
      if (p2.w<30) {
        p2.w=30;
      }
    }
  }

  void update() {
    if (pos.x < width/2 + 25 || pos.x > width) {
      vel.x = -vel.x;
    }
    if (pos.y < 0) {
      vel.y = -vel.y;
    }

    pos.add(vel);

    if (pos.y > height) {
      restart();
      score1++;
      p2.w = 100;
    }
  }

  void display() {
    ellipseMode(CENTER);
    fill(255);
    ellipse(pos.x, pos.y, 25, 25);
  }
}
