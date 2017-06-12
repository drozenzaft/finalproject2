int lives;
int enemiesSpawned;
int score;
int squareSize;
int startX, startY, currentX, currentY, goalX, goalY;
ArrayList<Enemy> enemies;
ArrayList<Square> towers;
Map map;
int setupMillis;

void setup() {
  size(1050, 700);
  background(255);
  squareSize = 30;
  currentX = 0;
  currentY = 1;
  startX = 0;
  startY = 2;
  goalX = width/squareSize-1;
  goalY = height/squareSize-3;
  map = new Map();
  map.setAllDist();
  lives = 100;
  score = 0;
  enemies = new ArrayList<Enemy>();
  towers = new ArrayList<Square>();
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
  new Square((int)(mouseX/squareSize), (int)(mouseY/squareSize)).mouse();
}

void draw() {
  map.display();
  if (mousePressed) mouseClicked();
  //System.out.println(millis() + ", " + enemiesSpawned);
  if (shouldSpawn()) {
    enemies.add(new Enemy());
    enemiesSpawned++;
  }
  for (int i = 0; i < enemies.size(); i++) {
    //if (i%5 == 0) enemies.get(i).hp = 1;
    if (enemies.get(i).killed()) {
      enemies.remove(i);
      score += 10;
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
    if (millis() >= a.fireMillis + 1000) {
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
  if (lives <= 0) {
    noLoop();
    textSize(width/12);
    textAlign(CENTER, BOTTOM);
    fill(255, 0, 0);
    text("GAME OVER\nFINAL SCORE:\n"+score, width/2, height/2);
  }
}