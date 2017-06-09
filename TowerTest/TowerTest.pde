Money m = new Money(50);
ArrayList<Tower> t = new ArrayList<Tower>();
Tower o = new Tower(50, 20, m);
int lives;//to be augmented by Daniel's code
int score;//to be augmented by Daniel's code
int level;//to be augmented by Daniel's code
boolean noMore;
void setup() {
  size(1050, 850);
  background(205);
  lives = 100;
  score = 0;
  level = 1;
  noMore = true;
}

void mousePressed() {
  t.add(o);
  o.createTower();
}

  void draw() {
    /**SideBar s = new SideBar(600);
     s.display();*/
    background(205);
    fill(0, 128, 255);
    rect(275, 5, 50, 50, 30);
    if (mousePressed && mouseX <= 325 && mouseX >= 275 && mouseY >= 5 && mouseY <= 55 && o.costToBuy <= m.showMoney()) {
      noMore = false;

      //o.createTower();
      if (mousePressed) {
        if (!noMore) {
          fill(0, 128, 255);
          rect(mouseX, mouseY, 50, 50, 30);
          noMore = true;
          m.buy(o.costToBuy);
          //mouseReleased();
        }
        //rect(mouseX, mouseY, 30, 30, 15);}
      }
    }
    //rect(0, -1, 1050, 850 / 50 * 8);
    textSize(width / 50);
    text("MONEY: " + m.showMoney() + "     LIVES: " + lives, 0, 20);
    fill(0, 102, 153);
    text("SCORE: " + score + "        LEVEL: " + level, 0, 50);
    fill(0, 182, 153);//lives, score, level

    //}
    //createTower();
  }