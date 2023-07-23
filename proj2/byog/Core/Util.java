package byog.Core;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author chenglibin
 */
public class Util {
    public static long parseNumber(String input) {
        Pattern pattern = Pattern.compile("[0-9]+");
        Matcher matcher = pattern.matcher(input);

        if (matcher.find()) {
            String numberString = matcher.group();
            return Integer.parseInt(numberString);
        }

        return 0;
    }
}
