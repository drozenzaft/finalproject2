class Projectile {
  boolean dead;
  PVector start, position;
  float speed, size, range;
  color c;
  int fireMillis;
  int dmg;
  Projectile(int xcor, int ycor, int damage, int range) {
    dead = false;
    start = new PVector(xcor, ycor);
    position = new PVector(xcor, ycor);
    speed = 2;
    this.range = range;
    c = color(255, 135, 39);
    size = 10;
    fireMillis = millis();
    dmg = damage;
  }
  Enemy closeEnough(float radius) {
    for (int i = 0; i < enemies.size(); i++) {
      if (dist(enemies.get(i).position.x, enemies.get(i)
        .position.y, position.x, position.y) <= radius) 
        return enemies.get(i);
    }
    return null;
  }
  boolean hit(Enemy e) {
    if (dist(e.position.x, e.position.y, position.x, position.y) <= 1) {
      e.hp -= dmg;
      dead = true;
      return true;
    }
    return false;
  }
  void setBoundaries() {
    if (position.y/50 <= 1 || position.y >= height-12
      || position.x <= 12 || position.x >= width-12 ||
      dist(start.x, start.y, position.x, position.y) >= range) dead = true;
  }
  void display() {
    fill(c);
    stroke(c);
    ellipse(position.x+size/2, position.y+size/2, size, size);
  }
  PVector attack(Enemy e) {
    PVector velocity;
    PVector placeHolder = e.position.copy();
    velocity = placeHolder.sub(position.x, position.y, position.z);
    velocity.normalize();
    velocity.mult(speed);
    return velocity;
  }
  void fire() {
    Enemy e = closeEnough(range);
    if (e != null) {
      PVector a = attack(e);
      fireMillis = millis();
      while (!dead) {
        display();
        if (hit(e)) side.mon.addMoney(1);
        setBoundaries();
        position.add(a);
      }   
      position = start.copy();
    }
  }
}