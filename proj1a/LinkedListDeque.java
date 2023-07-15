/*
four improvements:
1. rebranding
2. Bureaucracy
3. Public vs. Private
4. Nested Classes (static)
5. Caching
6. The Empty List and Sentinel Nodes
7. Looking Back
8. Sentinel Upgrade
 */

public class LinkedListDeque<T> {
    /*
    use static means that Node class doesn't get a reference to its boss, saving us a small amount of memory
     */
    public static class Node<T> {
        public T value;
        public Node prior;
        public Node next;
        public Node(T x, Node prior, Node next) {
            this.value = x;
            this.prior = prior;
            this.next = next;
        }
    }

    private int size;
    private Node front;
    private Node back;

    public LinkedListDeque() {
        this.front = null;
        this.back = null;
        this.size = 0;
    }

    public void addFirst(T item) {
        this.size += 1;

        if (this.front == null) {
            this.front = new Node(item, null, null);
            return;
        }

        Node p = this.front;
        Node tmp = new Node(item, null, p);
        p.prior = tmp;
        this.front = tmp;
    }

    public void addLast(T item) {

    }

    public boolean isEmpty() {

    }

    public int size() {
        return this.size;
    }

    public void printDeque() {

    }

    public T removeFirst() {

    }

    public T removeLast() {

    }

    public T get(int index) {

    }

    public T getRecursive(int index) {

    }
}
