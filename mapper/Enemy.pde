class Enemy {
  int hp;
  color c;
  float size;
  PVector start, position, velocity;
  Enemy() {
    hp = 5;
    c = color(255, 0, 0);
    position = new PVector(50, random(100)*randD()+(height-25)/2);
    start = position.copy();
    size = 8;
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
  ArrayList<Location> getNeighbors(Location current) {
    ArrayList<Location> ans = new ArrayList<Location>();
    int x = current.getX();
    int y = current.getY();
    int sx = (int)position.x;
    int ex = (int)end.x;
    int sy = (int)position.y;
    int ey = (int)end.y;
    int newX = 0;
    int newY = 0;
    int[][] neighbors = {{10, 0}, {-10, 0}, {0, 10}, {0, -10}};
    for (int[] i : neighbors) {
      velocity = new PVector(i[0], i[1]);
      newX = x + i[0];
      newY = y + i[1];
      current = new Location(newX, newY, current, Math.abs(newX-sx)+Math.abs(newY-sy), Math.abs(newX-ex)+Math.abs(newY-ey));
      if (inBounds(current)) {
        ans.add(current);
      }
    }
    return ans;
  }

  boolean inBounds(Location x) {
    return x.getX() > start.x + size/2 && get(x.getX(), x.getY()) == color(255) && cleared(velocity);
  }

  boolean cleared(PVector velocity) {
    if (velocity.x == 10)
      for (int x = (int)position.x; x <= position.x+10; x++) if (get(x, (int)position.y) == color(0)) return false;
    if (velocity.x == -10) 
      for (int x = (int)position.x; x >= position.x-10; x--) if (get(x, (int)position.y) == color(0)) return false;
    if (velocity.y == 10)
      for (int y = (int)position.y; y <= position.y+10; y++) if (get((int)position.x, y) == color(0)) return false;
    if (velocity.y == -10)
      for (int y = (int)position.y; y >= position.y-10; y--) if (get((int)position.x, y) == color(0)) return false;
    return true;
  }

  boolean reachGoal() {
    int x,y;
    FrontierPriorityQueue frontier = new FrontierPriorityQueue(true);
    Location current = new Location((int)position.x, (int)position.y, null, 0, (int)end.x-(int)position.x+(int)Math.abs(end.y-position.y));
    frontier.add(current);
    while (frontier.size() > 0) {
      current = frontier.next();
      System.out.println(current.getX()+","+position.x);
      x = Math.abs(current.getX()-(int)position.x);
      y = Math.abs(current.getY()-(int)position.y);
      position.add(new PVector(x,y));
      if (position.x >= end.x) {
        lives--;
        return true;
      }
      for (Location n : getNeighbors(current)) {
        frontier.add(n);
      }
    }
    return false;
  }
  void loseHealth() {
    hp--;
  }
}