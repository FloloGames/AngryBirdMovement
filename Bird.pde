class Bird {
  PVector loc;
  PVector target;
  boolean zielen = false;
  float GRAVITY = (width+height)/1100;
  float size = (width+height)/30;
  float speed = (width+height)/2080;
  Bird(float x, float y) {
    loc = new PVector(x, y);
    target = new PVector(0, 0);
  }
  void show() {
    fill(255, 255, 0);
    stroke(255, 255, 0);
    ellipse(loc.x, loc.y, size, size);
  }
  void mouseIsPressed() {
    float dist = dist(mouseX, mouseY, loc.x, loc.y);
    if (dist < size/2) {
      zielen = true;
    } else {
      zielen = false;
    }
  }
  void mouseIsReleased() {
    if (zielen == true) {
      zielen = false;
      PVector mouse = new PVector(mouseX, mouseY);
      target.set(0, 0);
      //target = PVector.sub(loc, mouse);
      target = PVector.sub(mouse, loc);
      target.mult(speed/4);
    }
  }
  void update() {
    if (zielen == true) {
      stroke(255);
      strokeWeight(3);
      line(loc.x, loc.y, mouseX, mouseY);
      strokeWeight(1);
    }
    if (target.x != 0 && target.y != 0) {
      loc.add(target);
      target.mult(0.99);
    }
    if (loc.x+size/2 > width || loc.x-size/2 < 0) {
      target.x *= -1;
    }
    if (loc.y+size/2 > height || loc.y-size/2 < 0) {
      target.y *= -1;
    } else {
      target.y += GRAVITY;
    }
    loc.x = constrain(loc.x, -1+size/2, width+1+size/2);
    loc.y = constrain(loc.y, -1+size/2, height+1+size/2);
  }
}
