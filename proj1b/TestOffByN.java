import org.junit.Test;
import static org.junit.Assert.*;

public class TestOffByN {
    static OffByN test = new OffByN(5);

    @Test
    public void testEqualChars() {
        assertEquals(true, test.equalChars('a', 'f'));
    }
}
