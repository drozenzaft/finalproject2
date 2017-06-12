class Enemy {
  int hp;
  color c;
  float size;
  boolean dead;
  PVector position;
  float speed;
  Enemy() {
    hp = 5;
    c = color(0);
    speed = 2;
    position = new PVector(startX*squareSize,startY*squareSize);
    size = 24;
  }
  boolean killed() {
    return hp <= 0;
  }
  void display() {
    fill(c);
    stroke(c);
    ellipse(position.x+squareSize/2, position.y+squareSize/2, size, size);
    if (hp > 3) fill(0,squareSize/25,0);
    else if (hp == 3) fill(255,squareSize/25,0);
    else fill(255,0,0);
    text(""+hp,position.x+squareSize/2-size/7,position.y+squareSize/2+size/4);
  }
  void move() {
    if (position.x/squareSize == goalX && goalY == (int)(position.y/squareSize)) {
      side.decreaseLives();
      dead = true;
    }
    float[] a = gps().nextMove();
    position.add(new PVector(a[0]*speed,a[1]*speed));;
  } 
  Square gps() {
    return map.get((int)(position.x/squareSize), (int)(position.y/squareSize));
  }
}