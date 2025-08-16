package hw3.hash;

import org.junit.Test;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertTrue;

import java.util.HashSet;
import java.util.List;
import java.util.ArrayList;


public class TestSimpleOomage {

    @Test
    public void testHashCodeDeterministic() {
        SimpleOomage so = SimpleOomage.randomSimpleOomage();
        int hashCode = so.hashCode();
        for (int i = 0; i < 1000; i += 1) {
            assertEquals(hashCode, so.hashCode());
        }
    }

    @Test
    public void testHashCodePerfect() {
        /*
          meaning no two SimpleOomages should EVER have the same
          hashCode UNLESS they have the same red, blue, and green values!
         */
        for (int i = 0; i < 255; i += 5) {
            for (int j = 0; j < 255; j += 5) {
                for (int k = 0; k < 255; k += 5) {
                    for (int i1 = 0; i1 < 255; i1 += 5) {
                        for (int j1 = 0; j1 < 255; j1 += 5) {
                            for (int k1 = 0; k1 < 255; k1 += 5) {
                                if (i != i1 || j != j1 || k != k1) {
                                    SimpleOomage o1 = new SimpleOomage(i, j, k);
                                    SimpleOomage o2 = new SimpleOomage(i1, j1, k1);
                                    long h1 = o1.hashCode();
                                    long h2 = o2.hashCode();
                                    assertNotEquals(h1, h2);
                                }
                            }
                        }
                    }
                }
            }
        }
//        SimpleOomage so1 = new SimpleOomage(0, 0, 0);
//        SimpleOomage so2 = new SimpleOomage(1, 3, 2);
//        int hashCode1 = so1.hashCode();
//        int hashCode2 = so2.hashCode();
//        assertEquals(hashCode1, hashCode2);
    }

    @Test
    public void testEquals() {
        SimpleOomage ooA = new SimpleOomage(5, 10, 20);
        SimpleOomage ooA2 = new SimpleOomage(5, 10, 20);
        SimpleOomage ooB = new SimpleOomage(50, 50, 50);
        assertEquals(ooA, ooA2);
        assertNotEquals(ooA, ooB);
        assertNotEquals(ooA2, ooB);
        assertNotEquals(ooA, "ketchup");
    }


    @Test
    public void testHashCodeAndEqualsConsistency() {
        SimpleOomage ooA = new SimpleOomage(5, 10, 20);
        SimpleOomage ooA2 = new SimpleOomage(5, 10, 20);
        HashSet<SimpleOomage> hashSet = new HashSet<>();
        hashSet.add(ooA);
        assertTrue(hashSet.contains(ooA2));
    }

    @Test
    public void testRandomOomagesHashCodeSpread() {
        List<Oomage> oomages = new ArrayList<>();
        int N = 10000;

        for (int i = 0; i < N; i += 1) {
            oomages.add(SimpleOomage.randomSimpleOomage());
        }

        assertTrue(OomageTestUtility.haveNiceHashCodeSpread(oomages, 10));
    }

    /** Calls tests for SimpleOomage. */
    public static void main(String[] args) {
        jh61b.junit.textui.runClasses(TestSimpleOomage.class);
    }
}
