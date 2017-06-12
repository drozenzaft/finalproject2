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
  void decreaseLives(int num) {
    lives -= num;
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
    fill(255);
    rect(goalX*squareSize+squareSize,0,width,height);
    textSize(24); 
    fill(0, 102, 0);
    text("MONEY: " + mon.showMoney(), 1060, 20); 
    fill(204, 0, 0);
    text("LIVES: " + lives, goalX*squareSize+squareSize, 20);
    fill(0, 76, 153);
    text("SCORE: " + score, goalX*squareSize+squareSize, 45);
    text("LEVEL: " + level, goalX*squareSize+squareSize, 70);
    text("BUY TOWER:",goalX*squareSize+squareSize,100);
    rect(goalX*squareSize+squareSize*6, 75, 30, 30);
    /**if (mousePressed && mouseX >= 1060 && mouseX <= 1090 && mouseY >= 60 && mouseY <= 90) {
      if mon.buy(15);
    }*/
  }
}