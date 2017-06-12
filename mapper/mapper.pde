//int lives;
//SideBar side;
int enemiesSpawned;
//int score;
int squareSize;
int startX, startY, currentX, currentY, goalX, goalY;
ArrayList<Enemy> enemies;
Map map;
SideBar side;
int setupMillis;
ArrayList<Tower> towers;
boolean placing;

void setup() {
  size(1350, 700);
  background(255);
  squareSize = 30;
  currentX = 0;
  currentY = 1;
  startX = 0;
  startY = 2;
  goalX = (width - 300)/squareSize-1;
  goalY = (height)/squareSize-1;
  side = new SideBar();
  map = new Map();
  print("mapper");
  placing = false;
  map.setAllDist();
  towers = new ArrayList<Tower>();

  //lives = 100;
  //score = 0;
  enemies = new ArrayList<Enemy>();
  setupMillis = millis();
}

boolean shouldSpawn() {
  //the code in first comment on the following forum post helped me understand the concept of time intervals.
  //i modified it to suit this project.
  //https://forum.processing.org/one/topic/make-something-appear-on-a-time-interval.html
  if (millis() >= setupMillis + 1000) {
    setupMillis = millis();
    //spawns 20 enemies
    return enemiesSpawned < 20;
  }
  return false;
}

void mouseClicked() {
  if (mouseX >= 1060 && mouseX <= 1090 && mouseY >= 60 && mouseY <= 90) {
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
}
void placeTower() {
  if (placing && mousePressed && mouseX < 1020) {
    rect(mouseX, mouseY, 30, 30, 10);
    if (mousePressed) {
      
      towers.get(towers.size() - 1).setCoords(mouseX, mouseY);
      placing = false;
    }
  }
}
void showTowerInfo() {
  for (Tower t : towers) {
    if (mouseX >= t.getX() && mouseX <= t.getX() + 30 && mouseY >= t.getY() && mouseY <= t.getY() + 30 && mousePressed) {
      textSize(20);
      fill(0, 76, 153);
      text("DAMAGE: " + t.getDamage(), 1060, 120);
      text("RANGE: " + t.getRange(), 1200, 120);
      text("Cost to Sell: " + t.getSell(), 1060, 145);
      if (t.getNextUpgrade() == 0) {
        text("NO MORE UPGRADES AVAILABLE.", 1060, 170);
      } else {
        text("Cost of next upgrade: " + t.getNextUpgrade(), 1060, 170);
        rect(1060, 195, 100, 30);
        text("Buy next Upgrade: ", 1060, 195);
      }
    }   
  }
  textSize(12);
  fill(255);
}
void buyNextUpgrade(){
  if (mousePressed && mouseX >= 1060 && mouseX <= 1160 && mouseY >= 100 && mouseY <= 130){
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
  placeTower();
  showTowerInfo();
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
  //System.out.println(millis() + ", " + enemiesSpawned);
  if (shouldSpawn()) {
    enemies.add(new Enemy());
    enemiesSpawned++;
  }
  //map.displayTowers();
  for (int i = 0; i < enemies.size(); i++) {
    //if (i%5 == 0) enemies.get(i).hp = 1;
    if (enemies.get(i).killed()) {
      enemies.remove(i);
      //score += 10;
      side.increaseScore();
    } else {
      enemies.get(i).display();
      enemies.get(i).move();
    }
    if (enemies.get(i).dead) {
      enemies.remove(i);
      i--;
    }
  }
  if (side.getLives() <= 0) {
    noLoop();
    textSize(width/12);
    textAlign(CENTER, BOTTOM);
    fill(255, 0, 0);
    text("GAME OVER\nFINAL SCORE:\n"+side.getScore(), width/2, height/2);
  }
}