class Money {
  int money;
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