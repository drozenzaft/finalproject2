int lives;
int score;
PVector end;
ArrayList<Enemy> enemies;
Map map;

void setup() {
  size(1000, 700);
  background(255);
  lives = 20;
  score = 0;
  enemies = new ArrayList<Enemy>();
  /*for (int i = 0; i < 10; i++)*/  enemies.add(new Enemy());
  map = new Map();
  end = new PVector(width-50, (height-25)/2);
}

int distToStart() {
  return (int)(end.x-enemies.get(0).getStart().x+Math.abs(end.y-enemies.get(0).getStart().y));
}

int compareTo(PVector me, PVector other) {
  int m = (int)(me.x-enemies.get(0).getStart().x+Math.abs(me.y-enemies.get(0).getStart().y))
  + (int)(end.x-me.x+Math.abs(me.y-end.y));
  int o = (int)(other.x-enemies.get(0).getStart().x+Math.abs(other.y-enemies.get(0).getStart().y))
  + (int)(end.x-other.x+Math.abs(other.y-end.y));
    if (m > o) return 1;
    if (o < m) return -1;
    return 0;
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