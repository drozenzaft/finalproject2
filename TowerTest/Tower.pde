class Tower {
  int q;
  Tower(int c) {
    q = c;
  }
  void createTower() {
    rect(mouseX, mouseY, q, q, 30);
    if (mousePressed) {
      rect(mouseX, mouseY, q, q, 30);
    }
  }
  void display() {
    createTower();
  }
}