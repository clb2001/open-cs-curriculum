package byog.Core;

import byog.TileEngine.TERenderer;
import byog.TileEngine.TETile;
import edu.princeton.cs.algs4.StdDraw;

import java.awt.*;
import java.util.Random;
import java.util.List;

/**
 * @author chenglibin
 */
public class Game {
    TERenderer ter = new TERenderer();
    /* Feel free to change the width and height. */
    public static final int WIDTH = 81;
    public static final int HEIGHT = 31;

    /**
     * Method used for playing a fresh game. The game should start from the main menu.
     */
    public void playWithKeyboard() {
        drawStartUI();
        char firstChar = getFirstChar();
        if (firstChar == 'n') {
            newGame();
        } else if (firstChar == 'l') {
            loadGame();
        } else {
            System.exit(0);
        }
    }

    private void drawStartUI() {
        Util.initializeCanvas();
        Util.drawStartUI();
    }

    private char getFirstChar() {
        char chr;
        while (true) {
            if (!StdDraw.hasNextKeyTyped()) {
                continue;
            }
            chr = Character.toLowerCase(StdDraw.nextKeyTyped());
            if (chr == 'n' || chr == 'l' || chr == 'q') {
                break;
            }
        }
        return chr;
    }

    private void newGame() {
        long seed = Util.getSeed();
        ter.initialize(WIDTH, HEIGHT + 1);
        TETile[][] world = WorldMap.generateWorld(seed);
        ter.renderFrame(world);
        WorldMap.playGame(world);
    }

    private void loadGame() {

    }

    /**
     * Method used for autograding and testing the game code. The input string will be a series
     * of characters (for example, "n123sswwdasdassadwas", "n123sss:q", "lwww". The game should
     * behave exactly as if the user typed these characters into the game after playing
     * playWithKeyboard. If the string ends in ":q", the same world should be returned as if the
     * string did not end with q. For example "n123sss" and "n123sss:q" should return the same
     * world. However, the behavior is slightly different. After playing with "n123sss:q", the game
     * should save, and thus if we then called playWithInputString with the string "l", we'd expect
     * to get the exact same world back again, since this corresponds to loading the saved game.
     * @param input the input string to feed to your program
     * @return the 2D TETile[][] representing the state of the world
     */
    public TETile[][] playWithInputString(String input) {
        // Fill out this method to run the game using the input passed in,
        // and return a 2D tile representation of the world that would have been
        // drawn if the same inputs had been given to playWithKeyboard().

        TETile[][] finalWorldFrame = null;
        input = input.toLowerCase();

        char begin = input.charAt(0);
        if (begin == 'n') {
            finalWorldFrame = newGame(input);
        } else if (begin == 'l') {
            finalWorldFrame = loadGame(input);
        } else {
            System.exit(0);
        }
        return finalWorldFrame;
    }

    private TETile[][] newGame(String input) {
        // first, we should get the random seed.
        int index = input.indexOf('s');
        long seed = Util.parseNumber(input.substring(1, index));

        // second, we should initialize the map.
        TETile[][] finalWorldFrame = WorldMap.generateWorld(seed);

        // finally, play the game ...
        WorldMap.playGame(finalWorldFrame, input.substring(index + 1));

        return finalWorldFrame;
    }

    private TETile[][] loadGame(String input) {
        TETile[][] lastSavedWorld;
        lastSavedWorld = WorldMap.getSavedGame();
        WorldMap.playGame(lastSavedWorld, input.substring(1));
        return lastSavedWorld;
    }

}
