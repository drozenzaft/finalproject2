int lives;
int score;
PVector end;
ArrayList<Enemy> enemies;
Map map;
void setup() {
  size(1024, 700);
  background(255);
  lives = 20;
  score = 0;
  enemies = new ArrayList<Enemy>();
  for (int i = 0; i < 10; i++) enemies.add(new Enemy());
  map = new Map();
  end = new PVector(width-50, (height-25)/2);
}

void draw() {
  map.display();
  for (int i = 0; i < enemies.size(); i++) {
    if (enemies.get(i).dead()) {
      enemies.remove(i);
      score += 10;
    }
    enemies.get(i).display();
    if (enemies.get(i).reachGoal()) {
      System.out.println(true);
      enemies.remove(i);
    }
  }
  if (lives <= 0) {
    noLoop();
    textSize(width/12);
    textAlign(CENTER, CENTER);
    text("GAME OVER\nFINAL SCORE:\n"+score, width/2, height/2);
  }
}