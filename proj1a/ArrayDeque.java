public class ArrayDeque<T> {
    private int size;
    private int length;
    private int front;
    private int back;
    private T[] tmp;

    public ArrayDeque() {
        this.size = 8;
        this.length = 0;
        this.front = 0;
        this.back = 0;
        this.tmp = (T []) new Object[this.size];
    }

    private void resize(double factor) {
        T[] a = (T []) new Object[(int) (this.size * factor)];
        if (this.back > this.front) {
            System.arraycopy(this.tmp, this.front, a, 0, this.back - this.front + 1);
            this.back = this.back - this.front;
            this.front = 0;
        }
        else {
            System.arraycopy(this.tmp, 0, a, 0, this.back + 1);
            System.arraycopy(this.tmp, this.front, a,(int) (this.size * factor) - (this.size - this.front), (this.size - this.front));
            this.front = (int) (this.size * factor) - (this.size - this.front);
        }
        this.tmp = a;
        this.size = (int) (this.size * factor);
    }

    public void addFirst(T item) {
        if (this.length == 0) {
            this.length += 1;
            this.tmp[this.front] = item;
            return;
        }
        if (this.length == this.size) {
            resize(2);
        }
        this.length += 1;
        this.front = (this.front - 1 + this.size) % this.size;
        this.tmp[this.front] = item;
    }

    public void addLast(T item) {
        if (this.length == 0) {
            this.length += 1;
            this.tmp[this.back] = item;
            return;
        }
        if (this.length == this.size) {
            resize(2);
        }
        this.length += 1;
        this.back = (this.back + 1 + this.size) % this.size;
        this.tmp[this.back] = item;
    }

    public boolean isEmpty() {
        return this.length == 0;
    }

    public int size() {
        return this.length;
    }

    public void printDeque() {
        for (int i = this.front; (i + this.size) % this.size != this.back; i++) {
            System.out.print(this.tmp[(i + this.size) % this.size] + " ");
        }
        System.out.print(this.tmp[this.back]);
        System.out.println();
    }

    public T removeFirst() {
        if (this.length == 0) {
            return null;
        }
        else if (this.length == 1) {
            this.length -= 1;
            T res = this.tmp[this.front];
            this.front = 0;
            this.back = 0;
            if (((double) this.length) / this.size < 0.25 && this.size >= 16) {
                resize(0.5);
            }
            return res;
        }
        else {
            this.length -= 1;
            T res = this.tmp[this.front];
            this.front = (this.front + 1 + this.size) % this.size;
            if (((double) this.length) / this.size < 0.25 && this.size >= 16) {
                resize(0.5);
            }
            return res;
        }
    }

    public T removeLast() {
        if (this.length == 0) {
            return null;
        }
        else if (this.length == 1) {
            this.length -= 1;
            T res = this.tmp[this.front];
            this.front = 0;
            this.back = 0;
            if (((double) this.length) / this.size < 0.25 && this.size >= 16) {
                resize(0.5);
            }
            return res;
        }
        else {
            this.length -= 1;
            T res = this.tmp[this.back];
            this.back = (this.back - 1 + this.size) % this.size;
            if (((double) this.length) / this.size < 0.25 && this.size >= 16) {
                resize(0.5);
            }
            return res;
        }
    }

    public T get(int index) {
        return this.tmp[index];
    }
}
