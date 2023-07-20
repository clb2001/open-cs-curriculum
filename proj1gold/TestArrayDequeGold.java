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

        for (int i = 0; i < 500; i += 1) {
            if (i % 10 == 0) {
                sadLog.append("\n");
                assertEquals(String.valueOf(sadLog), sad.size(), proper.size());
            }

            double number = StdRandom.uniform();

            if (number < 0.25) {
                if (proper.isEmpty()) {
                    sadLog.append("isEmpty()\n");
                    assertTrue(String.valueOf(sadLog), sad.isEmpty());
                }
                Integer sadvalue = sad.removeFirst();
                Integer propervalue = proper.removeFirst();
                sadLog.append("removeFirst()\n");
                assertEquals(String.valueOf(sadLog), sadvalue, propervalue);
            } else if (number >= 0.25 && number < 0.5){
                if (proper.isEmpty()) {
                    sadLog.append("isEmpty()\n");
                    assertTrue(String.valueOf(sadLog), sad.isEmpty());
                }
                Integer sadvalue = sad.removeLast();
                Integer propervalue = proper.removeLast();
                sadLog.append("removeLast()\n");
                assertEquals(String.valueOf(sadLog), sadvalue, propervalue);
            } else if (number >= 0.5 && number < 0.75 && !proper.isEmpty()) {
                sad.addLast(i);
                proper.addLast(i);
                sadLog.append("addLast(").append(i).append(")\n");
            } else {
                sad.addFirst(i);
                proper.addFirst(i);
                sadLog.append("addFirst(").append(i).append(")\n");
            }
        }

//        sad.printDeque();
//        proper.printDeque();
    }
}
