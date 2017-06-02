class Tower {
  int q;
  Tower(int c) {
    q = c;
  }
  void createTower() {
    rect(mouseX, mouseY, q, q);
  }
}