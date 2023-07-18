public class Palindrome {
    public Deque<Character> wordToDeque(String word) {
        Deque temp = new LinkedListDeque();
        for (int i = 0; i < word.length(); i++) {
            temp.addLast(word.charAt(i));
        }
        return temp;
    }

    private boolean helper(String word, int begin, int end) {
        if (begin == end) {
            return true;
        }
        else if (begin > end) {
            return false;
        }
        else {
            return helper(word, begin + 1, end - 1) && (word.charAt(begin) == word.charAt(end));
        }
    }

    public boolean isPalindrome(String word) {
        if (word.length() == 0 || word.length() == 1) {
            return true;
        }
        return helper(word, 0, word.length() - 1);
    }

    public boolean isPalindrome(int word) {
        return true;
    }
}
