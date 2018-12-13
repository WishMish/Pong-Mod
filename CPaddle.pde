class Paddle {
  PVector pos;
  int w, h;

  Paddle(int whichPlayer) {
    w = 100;
    h = 25;
    if (whichPlayer == 1) {
      pos = new PVector((width/2) - width/4- 50, height - 70);
    } else if (whichPlayer == 2) {
      pos = new PVector((width/2) + width/4 - 50, height - 70);
    }
  }

  void update(int whichPlayer, boolean left, boolean right) {
    //if (up && pos.y > 5) {
    //  pos.y -= 5;
    //}
    //if (down && pos.y + h < height-5) {
    //  pos.y += 5;
    //}
    if (whichPlayer ==1) {
      if (left && pos.x >5) {
        pos.x -= 5;
      }
      if (right && pos.x <width/2 -w -5) {
        pos.x += 5;
      }
    }
    if (whichPlayer ==2) {
      if (left && pos.x>width/2 +15) {
        pos.x -= 5;
      }
      if (right && pos.x + w < width-5) {
        pos.x += 5;
      }
    }
  }

  void display() {
    rectMode(CORNER);
    fill(255);
    noStroke();
    rect(pos.x, pos.y, w, h);
  }
}
