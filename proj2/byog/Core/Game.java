package byog.Core;

import byog.TileEngine.TERenderer;
import byog.TileEngine.TETile;

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

    public void drawStartUI() {

    }

    public char getFirstChar() {
        return 'a';
    }

    public void newGame() {

    }

    public void loadGame() {

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

    public TETile[][] newGame(String input) {
        // first, we should get the random seed.
        int index = input.indexOf('s');
        long seed = Util.parseNumber(input.substring(1, index));

        // second, we should initialize the map.
        TETile[][] finalWorldFrame = generateWorld(seed);

        // finally, play the game ...

        return finalWorldFrame;
    }

    public TETile[][] loadGame(String input) {
        return null;
    }

    public TETile[][] generateWorld(long seed) {
        TETile[][] worldMap = new TETile[WIDTH][HEIGHT];

        // step 1: initialize the world map
        WorldMap.initializeWorld(worldMap);
        Random random = new Random(seed);

        // step 2: generate the rooms
        List<Room> rooms = WorldMap.generateRooms(worldMap, random, 10);

        // step 3: generate the hallways
        WorldMap.generateHalls(worldMap, random);

        // step 4: generator the connectors
        WorldMap.generateConnector(worldMap, random, rooms);

        // step 5: carve dead ends
        if (!rooms.isEmpty()) {
            WorldMap.carveDeadEnds(worldMap);
        }

        // step 6: carve extra walls
        WorldMap.carveExtraWalls(worldMap);

        // step 7: add door and initial player
        WorldMap.addDoorAndInitialPlayer(worldMap, random);

        return worldMap;
    }
}
