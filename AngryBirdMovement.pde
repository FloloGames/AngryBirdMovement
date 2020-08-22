Bird b;

void setup() {
  fullScreen();
  b = new Bird(width/2, height/2);
}
void draw() {
  background(0);
  b.show();
  b.update();
}
void mousePressed() {
  b.mouseIsPressed();
}
void mouseReleased() {
  b.mouseIsReleased();
}
