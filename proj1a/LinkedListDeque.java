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

public class LinkedListDeque {
    /*
    use static means that Node class doesn't get a reference to its boss, saving us a small amount of memory
     */
    public static class Node<T> {
        public T value;
        public Node prior;
        public Node next;
        public Node(T x, Node prior, Node next){
            this.value = x;
            this.prior = prior;
            this.next = next;
        }
    }

    private int size;
    private LinkedListDeque head;
    private LinkedListDeque tail;

    public LinkedListDeque(){
        this.head = null;
        this.tail = null;
        this.size = 0;
    }

    public <T> T getRecursive(int index){

    }

    public void ArrayDeque(){

    }

    public void add(){
        this.size += 1;
    }

    public void remove(){

    }

    public int get(){

    }

    public int size(){
        LinkedListDeque p = this;
        LinkedListDeque q = this;

    }
}
