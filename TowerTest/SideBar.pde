class SideBar{
  //needs all the data, message to display error
  int q;
  Money mon;
  SideBar(int c, Money m){
    q = c;
    mon = m;
  }
  void display(){
    rect(0, 0, width / 25, 800);
    background(255);
    textSize(width / 12);
    //text("MONEY: " + mon.showMoney());
    
  }
}