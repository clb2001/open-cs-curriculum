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
说实话，链表不是很好写
实现不好的地方，需要多写几个测试，肉眼debug会相当困难
 */

public class LinkedListDeque<T> {
    /*
    use static means that Node class doesn't get a reference to its boss, saving us a small amount of memory
    but if we want to use generic, we cannot define Node as static class
     */
    public class Node {
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
    /* using a sentinel node is necessary */
    private final Node sentinel;

    public LinkedListDeque() {
        this.front = null;
        this.back = null;
        this.sentinel = new Node(null, null, null);
        this.size = 0;
    }

    public void addFirst(T item) {
        this.size += 1;
        if (this.front == null) {
            Node tmp = new Node(item, this.sentinel, this.sentinel);
            this.sentinel.prior = tmp;
            this.sentinel.next = tmp;
            this.front = tmp;
            this.back = tmp;
        }
        else {
            Node tmp = new Node(item, this.sentinel, this.front);
            this.sentinel.next = tmp;
            this.front.prior = tmp;
            this.front = tmp;
        }
    }

    public void addLast(T item) {
        this.size += 1;
        if (this.back == null) {
            Node tmp = new Node(item, this.sentinel, this.sentinel);
            this.sentinel.prior = tmp;
            this.sentinel.next = tmp;
            this.front = tmp;
            this.back = tmp;
        }
        else {
            Node tmp = new Node(item, this.back, this.sentinel);
            this.sentinel.prior = tmp;
            this.back.next = tmp;
            this.back = tmp;
        }
    }

    public boolean isEmpty() {
        return this.size == 0;
    }

    public int size() {
        return this.size;
    }

    public void printDeque() {
        Node p = this.front;
        while (p != this.sentinel) {
            System.out.print(p.value + " ");
            p = p.next;
        }
        System.out.println();
    }

    public T removeFirst() {
        if (this.front == null) {
            return null;
        }
        else if (this.front == this.back) {
            this.size -= 1;
            T p = this.front.value;
            this.sentinel.next = this.sentinel;
            this.sentinel.prior = this.sentinel;
            this.front = null;
            this.back = null;
            return p;
        }
        else {
            this.size -= 1;
            Node p = this.front;
            this.sentinel.next = p.next;
            p.next.prior = this.sentinel;
            this.front = p.next;
            return p.value;
        }
    }

    public T removeLast() {
        if (this.back == null) {
            return null;
        }
        else if (this.front == this.back) {
            this.size -= 1;
            T p = this.front.value;
            this.sentinel.next = this.sentinel;
            this.sentinel.prior = this.sentinel;
            this.front = null;
            this.back = null;
            return p;
        }
        else {
            this.size -= 1;
            Node p = this.back;
            this.sentinel.prior = p.prior;
            p.prior.next = this.sentinel;
            this.back = p.prior;
            return p.value;
        }
    }

    public T get(int index) {
        if (index < 0 || index >= this.size) {
            return null;
        }
        int i = 0;
        Node p = this.front;
        while (i != index) {
            p = p.next;
            i++;
        }
        return p.value;
    }

    private T getRe(int index, int i, Node p) {
        if (p == null) {
            return null;
        }
        else if (i == index) {
            return p.value;
        }
        else {
            return getRe(index, i + 1, p.next);
        }
    }

    public T getRecursive(int index) {
        if (index < 0 || index >= this.size) {
            return null;
        }
        else {
            Node p = this.front;
            return getRe(index, 0, p);
        }
    }
}