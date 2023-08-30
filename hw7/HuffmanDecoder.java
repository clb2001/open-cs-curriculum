import javax.sound.midi.Sequencer;
import java.util.ArrayList;

public class HuffmanDecoder {
    public static void main(String[] args) {
        ObjectReader or = new ObjectReader(args[0]);
        Object x = or.readObject();
        Object y = or.readObject();
        Object z = or.readObject();
        BinaryTrie t = (BinaryTrie) x;
        int count = (int) y;
        BitSequence s = (BitSequence) z;
        char[] chars = new char[count];
        int index = 0;
        while (s.length() != 0) {
            Match m = t.longestPrefixMatch(s);
            chars[index] = m.getSymbol();
            index++;
            if (m.getSequence().length() <= s.length()) {
                s = s.allButFirstNBits(m.getSequence().length());
            }
        }
        FileUtils.writeCharArray(args[1], chars);
    }
}
