package byog.Core;

import edu.princeton.cs.algs4.StdDraw;

import java.awt.Font;
import java.awt.Color;

import static byog.Core.Game.HEIGHT;
import static byog.Core.Game.WIDTH;

/**
 * @author chenglibin
 */
public class Util {
    public static long parseNumber(String input) {
        return Long.parseLong(input);
    }

    public static void initializeCanvas() {
        StdDraw.setCanvasSize(WIDTH * 16, (HEIGHT + 1) * 16);
        StdDraw.setXscale(0, WIDTH);
        StdDraw.setYscale(0, HEIGHT + 1);
        StdDraw.clear(Color.BLACK);
        StdDraw.enableDoubleBuffering();
        StdDraw.setPenColor(Color.WHITE);
    }

    public static void drawStartUI() {
        Font font = new Font("Monaco", Font.PLAIN, 60);
        StdDraw.setFont(font);
        StdDraw.text(WIDTH / 2, 3 * HEIGHT / 4, "CS61B: MY WORLD");

        Font smallFont = new Font("Monaco", Font.PLAIN, 30);
        StdDraw.setFont(smallFont);
        StdDraw.text(WIDTH / 2, HEIGHT / 4 + 2, "New Game (N)");
        StdDraw.text(WIDTH / 2, HEIGHT / 4, "Load Game (L)");
        StdDraw.text(WIDTH / 2, HEIGHT / 4 - 2, "Quit (Q)");
        StdDraw.show();
    }

    public static long getSeed() {
        StdDraw.clear(Color.BLACK);
        StdDraw.setFont(new Font("Monaco", Font.PLAIN, 50));
        StdDraw.text(WIDTH / 2, 3 * HEIGHT / 4, "Please enter a random seed: ");
        StdDraw.show();
        String seedString = "";
        while (true) {
            StdDraw.clear(Color.BLACK);
            StdDraw.setFont(new Font("Monaco", Font.PLAIN, 50));
            StdDraw.text(WIDTH / 2, 3 * HEIGHT / 4, "Please enter a random seed: ");
            char digit;
            if (!StdDraw.hasNextKeyTyped()) {
                continue;
            }
            digit = Character.toLowerCase(StdDraw.nextKeyTyped());
            if (digit != 's') {
                if (!Character.isDigit(digit)) {
                    continue;
                }
                seedString += digit;
                StdDraw.setFont(new Font("Monaco", Font.PLAIN, 30));
                StdDraw.text(WIDTH / 2, HEIGHT / 2, seedString);
                StdDraw.show();
            } else {
                break;
            }
        }
        return parseNumber(seedString);
    }
}
