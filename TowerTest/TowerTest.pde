Tower t = new Tower(50);
void setup() {
  size(800, 600);
}

void mousePressed() {
  t.createTower();
}
void draw() {
  boolean p = false;
  background(200);
  if (mousePressed) {
    t.createTower();
  }
  //createTower();
}