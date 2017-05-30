class Enemy {
  int hp;
  color c;
  float size;
  PVector start;
  PVector position;
  Enemy() {
    hp = 5;
    c = color(255, 0, 0);
    position = new PVector(50, random(100)*randD()+(height-25)/2);
    start = new PVector((int)position.x, (int)position.y);
    size = 8;
  }
  PVector getStart() {
    return start;
  }
  int randD() {
    int x = (int)random(2);
    if (x == 0) return 1;
    return -1;
  }
  boolean dead() {
    return hp <= 0;
  }
  void display() {
    fill(c);
    stroke(255, 0, 0);
    ellipse(position.x, position.y, size, size);
  }
  ArrayList<PVector> getNeighbors(PVector current) {
    ArrayList<PVector> ans = new ArrayList<PVector>();
    int sx = (int)start.x;
    int ex = (int)end.x;
    int sy = (int)start.y;
    int ey = (int)end.y;
    int[][] neighbors = {{10, 0}, {-10, 0}, {0, 10}, {0, -10}};
    for (int[] i : neighbors) {
      //current = new Location(newX, newY, current, Math.abs(sx-newX)+Math.abs(sy-newY), Math.abs(newX-ex)+Math.abs(newY-ey));
      current = new PVector(i[0], i[1]);
      if (inBounds(current)) {
        ans.add(current);
      }
    }
    return ans;
  }

  boolean inBounds(PVector x) {
    return x.x > 50 + size/2 && get((int)x.x, (int)x.y) == color(255) && cleared(x);
  }

  boolean cleared(PVector c) {
    if ((int)c.x == 10)
      for (int x = 10; x <= (int)(position.x+10); x++) if (get((int)(position.x+x), (int)position.y) == color(0)) return false;
    if ((int)c.x == -10) 
      for (int x = -10; x >= (int)(position.x-10); x--) if (get((int)(position.x+x), (int)position.y) == color(0)) return false;
    if ((int)c.y == 10)
      for (int y = 10; y <= (int)(position.y+10); y++) if (get((int)position.x, (int)(position.y+y)) == color(0)) return false;
    if ((int)c.y == -10)
      for (int y = -10; y >= (int)(position.y-10); y--) if (get((int)position.x, (int)(position.y+y)) == color(0)) return false;
    return true;
  }

  boolean reachGoal() {
    FrontierPriorityQueue frontier = new FrontierPriorityQueue(true);
    PVector current = start.copy();
    frontier.add(current);
    while (frontier.size() > 0) {
      current = frontier.next();
      position.add(current);
      if (position.x >= end.x) {
        lives--;
        return true;
      }
      for (PVector n : getNeighbors(current)) {
        frontier.add(n);
      }
    }
    return false;
  }
  void loseHealth() {
    hp--;
  }
}