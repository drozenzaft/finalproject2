class Ahh {
  void setup() {
    size(800, 600);
  }

  void mousePressed() {
    Tower t = new Tower(50);
    t.createTower();
  }
  void draw() {
    background(200);
    //createTower();
  }
}