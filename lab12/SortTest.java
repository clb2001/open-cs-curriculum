import edu.princeton.cs.algs4.Queue;
import org.junit.Test;

public class SortTest {
    @Test
    public void testMergeSort() {
        Queue<String> students = new Queue<String>();
        students.enqueue("Alice");
        students.enqueue("Vanessa");
        students.enqueue("Ethan");
        MergeSort.mergeSort(students);
        while (!students.isEmpty()) {
            System.out.println(students.dequeue());
        }
    }

    @Test
    public void testQuickSort() {
        Queue<String> students = new Queue<String>();
        students.enqueue("Alice");
        students.enqueue("Vanessa");
        students.enqueue("Ethan");
        QuickSort.quickSort(students);
        while (!students.isEmpty()) {
            System.out.println(students.dequeue());
        }
    }
}
