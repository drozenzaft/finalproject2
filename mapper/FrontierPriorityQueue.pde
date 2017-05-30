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
  void add(PVector coord) {
    size++;
    locations.add(coord);
  }
  PVector next() {
    size--;
    return locations.remove();
  }
}