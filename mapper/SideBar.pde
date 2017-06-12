class SideBar {
  Money mon;
  int lives;
  int score;
  int level;

  SideBar() {
    mon = new Money(50);
    lives = 100;
    score = 0;
    level = 1;
  }
  int getLives() {
    return lives;
  }
  void decreaseLives() {
    lives--;
  }
  int getScore() {
    return score;
  }
  void increaseScore() {
    score += 10;
  }
  Money getMoney(){
    return mon;
  }
  void display() {
    /**textSize(1);
     fill(0, 102, 153);
     text("Lives: " + lives, 10, 30); 
     textSize(32);
     fill(0, 102, 153);
     text("Money: " + mon.showMoney(), 10, 60);*/

    textSize(24); 
    fill(0, 102, 0);
    text("MONEY: " + mon.showMoney(), 1060, 20); 
    fill(204, 0, 0);
    text("LIVES: " + lives, 1200, 20);
    fill(0, 76, 153);
    text("SCORE: " + score, 1060, 45);
    text("LEVEL: " + level, 1200, 45);
    rect(1060, 60, 30, 30, 10);
    /**if (mousePressed && mouseX >= 1060 && mouseX <= 1090 && mouseY >= 60 && mouseY <= 90) {
      if mon.buy(15);
    }*/

    textSize(12);
    fill(255);
  }
}