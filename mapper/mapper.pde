int lives;
int enemiesSpawned;
int score;
int startX, startY, currentX, currentY, goalX, goalY;
ArrayList<Enemy> enemies;
Map map;
int setupMillis;

void setup() {
  size(1050, 850);
  background(255);
  currentX = 0;
  currentY = 1;
  startX = 0;
  startY = 2;
  goalX = width/50-1;
  goalY = 13;
  map = new Map();
  lives = 100;
  score = 0;
  enemies = new ArrayList<Enemy>();
  setupMillis = millis();
}

boolean shouldSpawn() {
  if (millis() > setupMillis + 1000) {
    setupMillis = millis();
    //spawns 20 enemies
    return enemiesSpawned < 20;
  }
  return false;
}

void draw() {
  map.display();
  System.out.println(millis() + ", " + enemiesSpawned);
  if (shouldSpawn()) {
    enemies.add(new Enemy());
    enemiesSpawned++;
  }
  for (int i = 0; i < enemies.size(); i++) {
    //if (i%5 == 0) enemies.get(i).hp = 1;
    if (enemies.get(i).killed()) {
      enemies.remove(i);
      score += 10;
    } 
    else {
      enemies.get(i).display();
      enemies.get(i).move();
    }
    if (enemies.get(i).dead) {
      enemies.remove(i);
      i--;
    }
  }
  if (lives <= 0) {
    noLoop();
    textSize(width/12);
    textAlign(CENTER, BOTTOM);
    fill(255,0,0);
    text("GAME OVER\nFINAL SCORE:\n"+score, width/2, height/2);
  }
}