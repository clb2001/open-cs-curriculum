import static org.junit.Assert.*;

import org.junit.Test;

public class FlikTest {
    @Test
    // 所有测试都必须是非静态的
    public void testisSameNumber(int i, int j){
        assertEquals(i, j);
    }
}
