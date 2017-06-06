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
<<<<<<< HEAD
  background(0, 128, 255);
  t.createTower();
}
//createTower();
=======
  background(200);
  SideBar s = new SideBar(600);
  s.display();
  if (mousePressed) {
    t.createTower();
  }
  //createTower();
}
>>>>>>> 97ef7e99c5c35590df7f3a8db95e9d7ed256da35
