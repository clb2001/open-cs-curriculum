import edu.princeton.cs.algs4.Queue;
import org.junit.Test;

import static org.junit.Assert.*;

public class SortTest {
    // 注意它的要求，不能改变原来的队列
    @Test
    public void testMergeSort() {
        Queue<String> students = new Queue<String>();
        students.enqueue("Alice");
        students.enqueue("Vanessa");
        students.enqueue("Ethan");
        students = MergeSort.mergeSort(students);
        assertEquals(students.dequeue(), "Alice");
        assertEquals(students.dequeue(), "Ethan");
        assertEquals(students.dequeue(), "Vanessa");
    }

    @Test
    public void testQuickSort() {
        Queue<String> students = new Queue<String>();
        students.enqueue("Alice");
        students.enqueue("Vanessa");
        students.enqueue("Ethan");
        students = QuickSort.quickSort(students);
        assertEquals(students.dequeue(), "Alice");
        assertEquals(students.dequeue(), "Ethan");
        assertEquals(students.dequeue(), "Vanessa");
    }
}
