Money p = new Money(50);
Tower t = new Tower(50, 20, p);
void setup() {
  size(1050, 850);
  background(255);
}

void mousePressed() {
  t.createTower();
}
void draw() {
  boolean p = false;
  /**SideBar s = new SideBar(600);
   s.display();
   if (mousePressed) {*/
  t.createTower();
  rect(0, -1, 1050, 850 / 50 * 4);
  textSize(width/50);
  textAlign(RIGHT, TOP);
  fill(144, 0, 0);
  text("MONEY: " + 20);//p.showMoney());
  
  
  //}
  //createTower();
}