import static org.junit.Assert.*;
import org.junit.Test;

import java.util.ArrayList;


public class TestArrayDequeGold {
    /*
     * @source
     */
    @Test
    public void test() {
        StudentArrayDeque<Integer> sad = new StudentArrayDeque<>();
        ArrayDequeSolution<Integer> proper = new ArrayDequeSolution<>();
        StringBuilder sadLog = new StringBuilder();

        for (int i = 0; i < 100; i += 1) {
            int number = StdRandom.uniform(0, 100);

            if (number < 25 && !proper.isEmpty()) {
                Integer sadvalue = sad.removeFirst();
                Integer propervalue = proper.removeFirst();
                sadLog.append("removeFirst()\n");
                assertEquals(String.valueOf(sadLog), sadvalue, propervalue);
            } else if (number >= 25 && number < 50 && !proper.isEmpty()){
                Integer sadvalue = sad.removeLast();
                Integer propervalue = proper.removeLast();
                sadLog.append("removeLast()\n");
                assertEquals(String.valueOf(sadLog), sadvalue, propervalue);
            } else if (number >= 50 && number < 75 && !proper.isEmpty()) {
                sad.addLast(i);
                proper.addLast(i);
                sadLog.append("addLast(").append(i).append(")\n");
            } else {
                sad.addFirst(i);
                proper.addFirst(i);
                sadLog.append("addFirst(").append(i).append(")\n");
            }
        }

        sad.printDeque();
        proper.printDeque();
    }
}
