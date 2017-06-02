int lives;
int score;
int startX, startY, currentX, currentY, goalX, goalY;
ArrayList<Enemy> enemies;
Map map;

void setup() {
  //size(1050, 850);
  size(800,600);
  background(255);
  currentX = 0;
  currentY = 8;
  startX = 0;
  startY = 8;
  goalX = width/50-1;
  goalY = 2;
  map = new Map();
  lives = 20;
  score = 0;
  enemies = new ArrayList<Enemy>();
  enemies.add(new Enemy());
  //for (Enemy e : enemies) e.reachGoal();
}


void draw() {
  map.display();
  for (int i = 0; i < enemies.size(); i++) {
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
    textAlign(CENTER, CENTER);
    text("GAME OVER\nFINAL SCORE:\n"+score, width/2, height/2);
  }
}