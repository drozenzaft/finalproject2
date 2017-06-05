import java.util.*;
public class MyHeap {
  private ArrayList<Square> heap;
  private int constant;
  public MyHeap() {
    heap = new ArrayList<Square>();
    heap.add(null);
    constant = 1;
  }
  public MyHeap(boolean minMax) {
    heap = new ArrayList<Square>();
    heap.add(null);
    if (minMax) constant = 1;
    else constant = -1;
  }
  private int size() {
    return heap.size() - 1;
  }
  public void add(Square s) {
    heap.add(s);
    pushUp(size());
  }
  public Square remove() {
    swap(1, size());
    Square root = heap.remove(size());
    pushDown(1);
    return root;
  }
  public Square peek() {
    if (size() > 1) return heap.get(1);
    return null;
  }
  private void swap(int a, int b) {
    Square temp = heap.get(a);
    heap.set(a, heap.get(b));
    heap.set(b, temp);
  }
  private void pushUp(int i) {
    while (i > 1 && compare2(heap.get(i), heap.get(i/2)) > 0) {
      swap(i, i/2);
      i /= 2;
    }
  }

  private void pushDown(int i) {
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
  private int compare2(Square me, Square other) {
    return constant * me.compareTo(other);
  }
  public String toString() {
    String ans = "[";
    for (Square a : heap) ans += a + ", ";
    return ans.substring(0, ans.length()-2) + "]";
  }
}