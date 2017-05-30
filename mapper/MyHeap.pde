class MyHeap {
  ArrayList<PVector> heap;
  int constant;
  MyHeap() {
    heap = new ArrayList<PVector>();
    heap.add(null);
    constant = 1;
  }
  MyHeap(boolean minMax) {
    heap = new ArrayList<PVector>();
    heap.add(null);
    if (minMax) constant = 1;
    else constant = -1;
  }
  int size() {
    return heap.size() - 1;
  }
  void add(PVector s) {
    heap.add(s);
    pushUp(size());
  }
  PVector remove() {
    swap(1, size());
    PVector root = heap.remove(size());
    pushDown(1);
    return root;
  }
  PVector peek() {
    if (size() > 1) return heap.get(1);
    return null;
  }
  void swap(int a, int b) {
    PVector temp = heap.get(a);
    heap.set(a, heap.get(b));
    heap.set(b, temp);
  }
  void pushUp(int i) {
    while (i > 1 && compare2(heap.get(i), heap.get(i/2)) > 0) {
      swap(i, i/2);
      i /= 2;
    }
  }

  void pushDown(int i) {
    int bigger = 1;
    while (i*2 <= size() && compare2(heap.get(i), heap.get(i*2)) < 0 || size() >= i*2+1 && compare2(heap.get(i), heap.get(i*2+1)) < 0) {
      if (size() >= i*2+1) {
        if (compare2(heap.get(i*2), heap.get(i*2+1)) >= 0) bigger = i*2;
        else bigger = i*2+1;
      } else if (size() >= i*2) {
        bigger = i*2;
      } else {
        break;
      }
      swap(i, bigger);
      i = bigger;
    }
  }
  int compare2(PVector me, PVector other) {
    return constant * compareTo(me, other);
  }

  String toString() {
    String ans = "[";
    for (PVector a : heap) ans += "(" + a.x + ", " + a.y + ")" + ", ";
    return ans.substring(0, ans.length()-2) + "]";
  }
}