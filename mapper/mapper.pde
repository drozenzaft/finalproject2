int lives;
int score;
int startX, startY, goalX, goalY;
ArrayList<Enemy> enemies;
Map map;

void setup() {
  size(1050, 850);
  background(255);
  startX = 0;
  startY = 8;
  goalX = 20;
  goalY = 8;
  map = new Map();
  lives = 20;
  score = 0;
  enemies = new ArrayList<Enemy>();
  enemies.add(new Enemy());
}

void draw() {
  map.display();
  for (int i = 0; i < enemies.size(); i++) {
    if (enemies.get(i).dead()) {
      enemies.remove(i);
      score += 10;
    }
    enemies.get(i).display();
    if (enemies.get(i).reachGoal()) enemies.remove(i);
  }
  if (lives <= 0) {
    noLoop();
    textSize(width/12);
    textAlign(CENTER, CENTER);
    text("GAME OVER\nFINAL SCORE:\n"+score, width/2, height/2);
  }
}