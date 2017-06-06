Money p = new Money(50);
Tower t = new Tower(50, 20, p);
void setup() {
  size(800, 600);
}

void mousePressed() {
  t.createTower();
}
void draw() {
  boolean p = false;
  background(0, 128, 255);
  /**SideBar s = new SideBar(600);
  s.display();
  if (mousePressed) {*/
    t.createTower();
  //}
  //createTower();
}