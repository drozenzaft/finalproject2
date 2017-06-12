//int lives;
//SideBar side;
int enemiesSpawned;
//int score;
int squareSize;
int startX, startY, currentX, currentY, goalX, goalY;
ArrayList<Enemy> enemies;
//ArrayList<Square> towers;
Map map;
SideBar side;
int setupMillis;
Tower upgrader;
ArrayList<Tower> towers;
boolean placing;

void setup() {
  size(1200, 700);
  background(255);
  squareSize = 30;
  currentX = 0;
  currentY = 1;
  startX = 0;
  startY = 2;
  goalX = (width - 300)/squareSize-1;
  goalY = (height)/squareSize-3;
  side = new SideBar();
  map = new Map();
  placing = false;
  map.setAllDist();
  towers = new ArrayList<Tower>();

  //lives = 100;
  //score = 0;
  enemies = new ArrayList<Enemy>();
  //towers = new ArrayList<Square>();
  setupMillis = millis();
  upgrader = null;
}

boolean shouldSpawn() {
  //the code in first comment on the following forum post helped me understand the concept of time intervals.
  //i modified it to suit this project.
  //https://forum.processing.org/one/topic/make-something-appear-on-a-time-interval.html
  if (millis() >= setupMillis + 1000) {
    setupMillis = millis();
    //spawns 20 enemies
    return enemies.size() < 20;
  }
  return false;
}

void mouseClicked() {
  if (mouseX >= goalX*squareSize+squareSize*6 && mouseX <= goalX*squareSize+squareSize*6+30 && mouseY >= 75 && mouseY <= 105) {
    towers.add(new Tower());
    if (towers.get(towers.size() - 1).getBuy() > side.getMoney().showMoney()) {
      textSize(24);
      text("TOO LITTLE MONEY", 1060, 95);
      towers.remove(towers.size() - 1);
    } else {
      side.getMoney().buy(towers.get(towers.size() - 1).getBuy());
      placing = true;
    }
  }
  //new Square((int)(mouseX/squareSize), (int)(mouseY/squareSize)).mouse();
}
void placeTower() {
  if (placing && mousePressed && mouseX < goalX*squareSize+squareSize && mouseX > squareSize && mouseY > startY*squareSize && mouseY < height-(squareSize*2)) {
    rect((int)(mouseX/squareSize)*squareSize, (int)(mouseY/squareSize)*squareSize, 30, 30, 10);
    if (mousePressed) {
      towers.get(towers.size() - 1).setCoords((int)(mouseX/squareSize)*squareSize, (int)(mouseY/squareSize)*squareSize);
      towers.get(towers.size()-1).gps().mouse();
      placing = false;
    }
  }
}
Square gps() {
  try {
    return map.get((int)(mouseX/squareSize),(int)(mouseY/squareSize));
  }
  catch (IndexOutOfBoundsException e) {
    return null;
  }
}
void showTowerInfo() {
  if (towers.size() == 0) return;
  for (Tower a : towers) {
    if (gps() != null && mousePressed && gps().x == a.gps().x && gps().y == a.gps().y) {
      upgrader = a;
      break;
    }
  }
  if (upgrader == null) return;
  textSize(20);
  fill(0, 76, 153);
  text("DAMAGE: " + upgrader.getDamage(), goalX*squareSize+squareSize, 120);
  text("RANGE: " + upgrader.getRange(), goalX*squareSize+squareSize, 145);
  //text("Cost to Sell: " + t.getSell(), goalX*squareSize+squareSize, 170);
  if (upgrader.getNextUpgrade() == 0) {
    text("NO MORE UPGRADES AVAILABLE.", goalX*squareSize+squareSize, 170);
  } else {
    text("Cost of next upgrade: " + upgrader.getNextUpgrade(), goalX*squareSize+squareSize, 170);
    rect(goalX*squareSize+squareSize*7, 195, 100, 30);
    if (mousePressed && mouseX > goalX*squareSize+squareSize*7 && mouseX < goalX*squareSize+squareSize*7+100
      && mouseY > 195 && mouseY < 225 && upgrader.getNextUpgrade() < side.mon.showMoney()) 
      upgrader.buyNextUpgrade();
    text("Buy next Upgrade: ", goalX*squareSize+squareSize, 195);
  }
  textSize(12);
  fill(255);
}
void buyNextUpgrade() {
  if (mousePressed && mouseX >= 1060 && mouseX <= 1160 && mouseY >= 100 && mouseY <= 130) {
    towers.get(0).buyNextUpgrade();
  }
}



/** if (placing && mousePressed) {
 towers.get(towers.size() - 1).setCoords(mouseX, mouseY);
 side.getMoney().money -= towers.get(towers.size() - 1).costToBuy;//buy(towers.get(towers.size() - 1).getBuy());
 placing = false;*/
//for (Square[] a : map.squares) {
// for (Square s : a) {
//  if (s.x == (int)(mouseX/50) && s.y == (int)(mouseY/50)) s.mouse();
//}
// }
//new Square((int)(mouseX/squareSize), (int)(mouseY/squareSize)).mouse();




void draw() {
  map.display();
  side.display();
  showTowerInfo();
  placeTower();
  //showTowers();
  /**if (mousePressed && mouseX >= 1060 && mouseX <= 1090 && mouseY >= 60 && mouseY <= 90) {
   Tower t = new Tower();
   t.setCoords(1000, 30);
   t.display();
   }*/
  //if (mousePressed) mouseClicked();
  if (towers.size() > 0) {
    for (Tower t : towers) {
      t.display();
    }
  }
  if (shouldSpawn()) {
    enemies.add(new Enemy(side.level, side.level+1));
    enemiesSpawned++;
  }
  side.level = enemiesSpawned/20+1;
  //map.displayTowers();
  for (int i = 0; i < enemies.size(); i++) {
    if (enemies.get(i).killed()) {
      enemies.remove(i);
      side.increaseScore();
      i--;
    } else if (enemies.get(i).dead) {
      enemies.remove(i);
      i--;
    } else {
      enemies.get(i).display();
      enemies.get(i).move();
    }
  }
  for (int j = 0; j < towers.size(); j++) {
    Projectile a = towers.get(j).myProjectile;
    if (a != null && millis() >= a.fireMillis + 1000) {

      a.fireMillis = millis();
      // if (frameCount%10 == j%10) {
      //println(frameCount);
      a.fire();
      a.dead = false;
      //}
    }
    //(when the tower index last digit matches the frame count last digit)
    //(1/10th of the time) look at all monsters to shoot
  }
  if (side.getLives() <= 0) {
    noLoop();
    textSize(width/12);
    textAlign(CENTER, BOTTOM);
    fill(255, 0, 0);
    text("GAME OVER, N00B\nFINAL SCORE:\n"+side.getScore(), width/3+50, height-150);
  }
}