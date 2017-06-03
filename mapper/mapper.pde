int lives;
int score;
int startX, startY, currentX, currentY, goalX, goalY;
ArrayList<Enemy> enemies;
Map map;

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
  lives = 20;
  score = 0;
  enemies = new ArrayList<Enemy>();
  enemies.add(new Enemy()); 
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
    textAlign(CENTER, BOTTOM);
    fill(255,0,0);
    text("GAME OVER\nFINAL SCORE:\n"+score, width/2, height/2);
  }
}