public class FrontierPriorityQueue {
  private MyHeap locations;
  private int size;
  public FrontierPriorityQueue(boolean b) {
    locations = new MyHeap(b);
    size = 0;
  }
  public int size() {
    return size;
  }
  public void add(Square coord) {
    size++;
    locations.add(coord);
  }
  public Square next() {
    size--;
    return locations.remove();
  }
}