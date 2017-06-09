import java.util.*;
public class QueueFrontier {
  private ArrayDeque<Square> locations;
  private int size;
  public QueueFrontier() {
    locations = new ArrayDeque<Square>();
    size = 0;
  }
  public int size() {
    return size;
  } 
  public void add(Square coord) {
    locations.add(coord);
    size++;
  }
  public Square next() {
    size--;
    return locations.removeFirst();
  }
}