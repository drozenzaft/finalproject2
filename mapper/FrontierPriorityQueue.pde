class FrontierPriorityQueue {
  MyHeap locations;
  int size;
  FrontierPriorityQueue(boolean b) {
    locations = new MyHeap(b);
    size = 0;
  }
  int size() {
    return size;
  }
  void add(Square coord) {
    size++;
    locations.add(coord);
  }
  Square next() {
    size--;
    return locations.remove();
  }
}