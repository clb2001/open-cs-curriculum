import static org.junit.Assert.*;

import org.junit.Test;
public class TestPlanet {
//    @Test
    public void test(){
        Planet A = new Planet(0, 0, 1, 1, 1, "acorn3.gif");
        Planet B = new Planet(3, 4, 2, 2, 2, "acron-1.gif");
        assertEquals(5.0, A.calcDistance(B));// 会报错
    }
}
