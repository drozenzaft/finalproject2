Tower t = new Tower(50);
void setup() {
  size(800, 600);
}

void mousePressed() {
  t.createTower();
}
void draw() {
  boolean p = false;
  background(0, 128, 255);
  t.createTower();
}
//createTower();