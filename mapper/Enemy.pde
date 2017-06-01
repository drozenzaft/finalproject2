class Enemy {
  int hp;
  color c;
  float size;
  Square current;
  Enemy() {
    hp = 5;
    c = color(0);
    current = new Square(startX, startY);
    size = 15;
  }
  boolean dead() {
    return hp <= 0;
  }
  void display() {
    fill(c);
    stroke(c);
    ellipse(current.x()+size, current.y()+size, size, size);
  }
  ArrayList<Square> getNeighbors() {
    Square a;
    ArrayList<Square> ans = new ArrayList<Square>();
    int[][] neighbors = {{1, 0}, {-1, 0}, {0, 1}, {0, -1}};
    for (int[] i : neighbors) {
      a = new Square(current.x+i[0], current.y+i[1]);
      if (inBounds(a)) {
        ans.add(a);
      }
    }
    return ans;
  }

  boolean inBounds(Square x) {
    return x.x() > 0 && x.x() < width/50 && x.y() > 0 && x.y() < height/50;
  }

  boolean reachGoal() {
    FrontierPriorityQueue frontier = new FrontierPriorityQueue(true);
    frontier.add(current);
    while (frontier.size() > 0) {
      current = frontier.next();
      System.out.println(current);
      if (current.num() == 0) {
        lives--;
        return true;
      }
      for (Square n : getNeighbors()) frontier.add(n);
    }
    return false;
  }
}