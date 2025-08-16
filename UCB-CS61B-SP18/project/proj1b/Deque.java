public interface Deque<Item> {
    void printDeque();

    Item getRecursive(int i);

    Item removeFirst();

    Item removeLast();

    void addFirst(Item t);

    void addLast(Item t);

    int size();

    boolean isEmpty();
}
