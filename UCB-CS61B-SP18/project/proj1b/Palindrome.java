public class Palindrome {
    public Deque<Character> wordToDeque(String word) {
        Deque temp = new LinkedListDeque();
        for (int i = 0; i < word.length(); i++) {
            temp.addLast(word.charAt(i));
        }
        return temp;
    }

    private boolean helper(Deque<Character> tmp) {
        if (tmp.isEmpty() || tmp.size() == 1) {
            return true;
        } else {
            return (tmp.removeFirst().equals(tmp.removeLast())) && helper(tmp);
        }
    }

    public boolean isPalindrome(String word) {
        Deque<Character> tmp = wordToDeque(word);
        return helper(tmp);
    }

    private boolean newhelper(Deque<Character> tmp, CharacterComparator cc) {
        if (tmp.isEmpty() || tmp.size() == 1) {
            return true;
        } else {
            return cc.equalChars(tmp.removeFirst(), tmp.removeLast()) && newhelper(tmp, cc);
        }
    }

    public boolean isPalindrome(String word, CharacterComparator cc) {
        Deque<Character> tmp = wordToDeque(word);
        return newhelper(tmp, cc);
    }
}
