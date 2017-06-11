class Projectile {
  boolean dead;
  PVector start, position, velocity;
  float speed, size;
  color c;
  int spawnMillis;
  Projectile(int xcor, int ycor) {
    dead = false;
    start = new PVector(xcor, ycor);
    position = new PVector(xcor, ycor);
    speed = 8;
    c = color(255, 135, 39);
    size = 10;
  }
  Enemy closeEnough(float radius) {
    for (int i = 0; i < enemies.size(); i++) {
      if (dist(enemies.get(i).position.x, enemies.get(i)
        .position.y, position.x, position.y) <= radius) 
        return enemies.get(i);
    }
    return null;
  }
  void hit() {
    Enemy e = closeEnough(5);
    if (e != null) {
      e.hp--;
      dead = true;
    }
  }
  void setBoundaries() {
    if (position.y/50 <= 1 || position.y >= height-12
      || position.x <= 12 || position.x >= width-12 ||
      dist(start.x, start.y, position.x, position.y) >= 100) dead = true;
  }
  void display() {
    fill(c);
    stroke(c);
    ellipse(position.x+size/2, position.y+size/2, size, size);
  }
  void move() {
    setBoundaries();
    hit();
    println(position.x+", "+position.y);
    position.add(velocity);
  }
  void attack(Enemy e) {
    PVector placeHolder = e.position.copy();
    velocity = placeHolder.sub(position.x, position.y, position.z);
    velocity.normalize();
    velocity.mult(speed);
  }
  boolean canAttack() {
    if (millis() >= spawnMillis + 3000) {
      spawnMillis = millis();
      return true;
    }
    return false;
  }
  void fire() {
    Enemy e = closeEnough(100);
    println(e);
    if (canAttack() && e != null) {
      display();
      attack(e);
      move();
    }
  }
}