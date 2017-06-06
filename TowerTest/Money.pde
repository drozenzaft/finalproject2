class Money {
  int money;
  Money(int mon){
    money = mon;
  }
  void addMoney(int numDead) {
    money += numDead;
  }
  void buy(int cost) {
    money -= cost;
  }
  int showMoney() {
    return money;
  }
}