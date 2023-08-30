import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class HuffmanEncoder {
    public static Map<Character, Integer> buildFrequencyTable(char[] inputSymbols) {
        Map<Character, Integer> charCountMap = new HashMap<>();
        for (char c : inputSymbols) {
            if (charCountMap.containsKey(c)) {
                charCountMap.put(c, charCountMap.get(c) + 1);
            } else {
                charCountMap.put(c, 1);
            }
        }
        return charCountMap;
    }

    public static void main(String[] args) {
        char[] res = FileUtils.readFile(args[0]);
        Map<Character, Integer> freqTable = buildFrequencyTable(res);
        BinaryTrie trie = new BinaryTrie(freqTable);
        ObjectWriter ow = new ObjectWriter(args[0] + ".huf");
        ow.writeObject(trie);
        Map<Character, BitSequence> table = trie.buildLookupTable();
        List<BitSequence> sequences = new ArrayList<>();
        int count = 0;
        for (char c: res) {
            sequences.add(table.get(c));
            count++;
        }
        ow.writeObject(count);
        BitSequence r = BitSequence.assemble(sequences);
        ow.writeObject(r);
    }
}
